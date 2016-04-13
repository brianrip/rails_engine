require 'rails_helper'
include ApplicationHelper

RSpec.describe "Invoice transactions api" do
  it "returns all transactions for a invoice" do
    merchant = create_merchant("Joey")
    merchant2 = create_merchant("Jill")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant2.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "Success")
    transaction2 = create_transaction(invoice1.id, "Failure")
    transaction3 = create_transaction(invoice2.id, "Failure")

    get "/api/v1/invoices/#{invoice1.id}/transactions"

    expect(status).to eq(200)
    expect(response.body).to eq(Transaction.limit(2).to_json)
  end

end
