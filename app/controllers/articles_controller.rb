class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create_invoice]

  def create_invoice
    # 顧客情報の作成
    customer = Stripe::Customer.create(
      email: params[:email],
      name: params[:name],
      source: params[:source] # 例: クレジットカード情報
    )

    # 請求アイテムの作成
    Stripe::InvoiceItem.create(
      customer: customer.id,
      amount: params[:amount],          # 金額（例: 1000は¥1000）
      currency: params[:currency],      # 通貨（例: 'JPY'）
      description: params[:description] # 説明
    )

    # 請求書の作成
    invoice = Stripe::Invoice.create(
      customer: customer.id,
      collection_method: 'send_invoice',  # 請求方法を手動送信に設定
      due_date: (Time.now + 7.days).to_i  # 支払期限を7日後に設定
    )

    # 請求書を送信
    invoice.send_invoice

    # レスポンスを返す
    render json: { invoice: invoice }, status: :ok
  end
end
