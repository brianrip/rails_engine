require 'rails_helper'
include ApplicationHelper

RSpec.describe "invoice_items api" do
  it "returns all invoice_items" do
    merchant = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice = create_invoice(customer.id, merchant.id, "Shipped")
    item = create_item("hammer", 2000, merchant.id)
    invoice_item1 = create_invoice_item(item.id, invoice.id, 4000)
    invoice_item2 = create_invoice_item(item.id, invoice.id, 2000)

    get "/api/v1/invoice_items.json"

    expect(status).to eq(200)
    expect(response.body).to eq(InvoiceItem.all.to_json)
  end

  it "returns specific invoice" do
    merchant = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice = create_invoice(customer.id, merchant.id, "Shipped")
    item = create_item("hammer", 2000, merchant.id)
    invoice_item1 = create_invoice_item(item.id, invoice.id, 4000)
    invoice_item2 = create_invoice_item(item.id, invoice.id, 2000)

    get "/api/v1/invoice_items/#{invoice_item1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(invoice_item1.to_json)
  end
end
