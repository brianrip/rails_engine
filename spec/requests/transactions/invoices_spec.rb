require 'rails_helper'
include ApplicationHelper

RSpec.describe "Transaction invoice api" do
  it "returns invoice for a transaction" do
    merchant1 = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    customer2 = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "Success")
    transaction2 = create_transaction(invoice1.id, "Failure")

    get "/api/v1/transactions/#{transaction1.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(invoice["customer_id"]).to eq(customer.id)
   end
end
