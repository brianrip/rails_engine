require 'rails_helper'
include ApplicationHelper

RSpec.describe "transaction api" do
  it "returns all transactions" do
    merchant1 = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "Success")
    transaction2 = create_transaction(invoice1.id, "Failure")

    get "/api/v1/transactions.json"

    expect(status).to eq(200)
    expect(response.body).to eq(Transaction.all.to_json)
  end

  it "returns specific transaction" do
    merchant1 = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "Success")
    transaction2 = create_transaction(invoice1.id, "Failure")

    get "/api/v1/transactions/#{transaction1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(transaction1.to_json)
  end
end
