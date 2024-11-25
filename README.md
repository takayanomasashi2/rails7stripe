# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

curl -X POST http://localhost:3000/articles/create_invoice \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@test.com",
    "name": "ブルテナサスInc.",
    "source": "tok_visa",
    "amount": 1000,
    "currency": "JPY",
    "description": "Test product"
  }'
