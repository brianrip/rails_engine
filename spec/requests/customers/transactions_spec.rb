require 'rails_helper'
include ApplicationHelper

RSpec.describe "Customer transactions api" do
  it "returns a customers invoices" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Bud")
    customer1 = create_customer("Joey", "Banks")
    customer2 = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer1.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer1.id, merchant1.id, "Shipped")
    invoice3 = create_invoice(customer2.id, merchant1.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "Success")
    transaction2 = create_transaction(invoice1.id, "Failure")
    transaction3 = create_transaction(invoice3.id, "Failure")


    get "/api/v1/customers/#{customer1.id}/transactions"

    transaction_count = JSON.parse(response.body).count

    expect(status).to eq(200)
    expect(transaction_count).to eq(2)
  end
end
