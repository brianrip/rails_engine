require 'rails_helper'
include ApplicationHelper

RSpec.describe "Merchant revenue api" do
  it "returns revenue of a merchant" do
    merchant = create_merchant("Joey")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant.id, "Shipped")
    item1 = create_item("hammer", 200.00, merchant.id)
    transaction1 = create_transaction(invoice1.id, "success")
    transaction2 = create_transaction(invoice1.id, "success")
    invoice_item1 = create_invoice_item(item1.id, invoice1.id, 40)
    invoice_item2 = create_invoice_item(item1.id, invoice1.id, 20)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    merchant_revenue = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(merchant_revenue["revenue"]).to eq("600.0")
  end

  it "returns revenue of a merchant on given date" do
    merchant = create_merchant("Joey")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant.id, "Shipped")
    item1 = create_item("hammer", 200.00, merchant.id)
    transaction1 = create_transaction(invoice1.id, "success")
    transaction2 = create_transaction(invoice1.id, "success")
    invoice_item1 = create_invoice_item(item1.id, invoice1.id, 40)
    invoice_item2 = create_invoice_item(item1.id, invoice1.id, 20)

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{invoice1.created_at}"
    merchant_revenue = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(merchant_revenue["revenue"]).to eq("0.0")
  end
end
