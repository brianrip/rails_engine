require 'rails_helper'
include ApplicationHelper

RSpec.describe "Merchants with most revenue api" do
  it "returns given number of merchants" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Tonya")
    merchant3 = create_merchant("Bre")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant2.id, "Shipped")
    invoice3 = create_invoice(customer.id, merchant3.id, "Shipped")
    item1 = create_item("hammer", 2000, merchant1.id)
    item2 = create_item("drill", 4000, merchant2.id)
    item3 = create_item("saw", 6000, merchant3.id)
    invoice_item1 = create_invoice_item(item1.id, invoice1.id, 2000)
    invoice_item2 = create_invoice_item(item1.id, invoice2.id, 4000)
    invoice_item3 = create_invoice_item(item3.id, invoice3.id, 6000)
    transaction1 = create_transaction(invoice1.id, "success")
    transaction2 = create_transaction(invoice2.id, "success")
    transaction3 = create_transaction(invoice3.id, "success")

    x = 2

    get "/api/v1/merchants/most_revenue?quantity=#{x}"

    merchant_count = JSON.parse(response.body).count

    expect(status).to eq(200)
    expect(merchant_count).to eq(2)
  end
end
