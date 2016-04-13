require 'rails_helper'
include ApplicationHelper

RSpec.describe "Invoice items api" do
  it "returns all items for a invoice" do
    merchant = create_merchant("Joey")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant.id, "Shipped")
    item1 = create_item("hammer", 2000, merchant.id)
    item2 = create_item("drill", 2000, merchant.id)
    item3 = create_item("saw", 2000, merchant.id)
    invoice_item1 = create_invoice_item(item1.id, invoice1.id, 4000)
    invoice_item2 = create_invoice_item(item2.id, invoice1.id, 2000)
    invoice_item3 = create_invoice_item(item3.id, invoice2.id, 2000)

    get "/api/v1/invoices/#{invoice1.id}/items"

    response_count = JSON.parse(response.body).count

    expect(status).to eq(200)
    expect(response_count).to eq(2)
  end
end
