require 'rails_helper'
include ApplicationHelper

RSpec.describe "Transactions finder api" do
  it "returns all merchants by attribute" do
    merchant1 = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "Success")
    transaction2 = create_transaction(invoice1.id, "Failure")
    transaction3 = create_transaction(invoice1.id, "Failure")

    get "/api/v1/transactions/find_all?result=Failure"

    response_count = JSON.parse(response.body).count

    expect(status).to eq(200)
    expect(response_count).to eq(2)
    expect(response.body).to eq(Transaction.where(result: "Failure").to_json)
  end

  it "returns a merchant by attribute" do
    merchant1 = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "Success")
    transaction2 = create_transaction(invoice1.id, "Failure")

    get "/api/v1/transactions/find?name=John"

    expect(status).to eq(200)
    expect(response.body).to eq(transaction1.to_json)
  end

  it "returns a random merchant" do
    merchant1 = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "Success")
    transaction2 = create_transaction(invoice1.id, "Failure")

    get "/api/v1/transactions/random"

    expect(status).to eq(200)
  end
end
