require 'rails_helper'
include ApplicationHelper

RSpec.describe "Invoice_items invoice api" do
  it "returns invoice for an invoice_item" do
    merchant = create_merchant("Joey")
    customer = create_customer("Tina", "Banks")
    customer2 = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant.id, "Shipped")
    invoice2 = create_invoice(customer2.id, merchant.id, "Shipped")
    item1 = create_item("hammer", 2000, merchant.id)
    item2 = create_item("drill", 2000, merchant.id)
    item3 = create_item("saw", 2000, merchant.id)
    invoice_item1 = create_invoice_item(item1.id, invoice1.id, 4000)
    invoice_item2 = create_invoice_item(item2.id, invoice1.id, 2000)
    invoice_item3 = create_invoice_item(item3.id, invoice2.id, 2000)

    get "/api/v1/invoice_items/#{invoice_item1.id}/item"
    item = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(item["name"]).to eq("hammer")
  end
end
