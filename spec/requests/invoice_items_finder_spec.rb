require 'rails_helper'
include ApplicationHelper

RSpec.describe "InvoiceItem finder api" do
  it "returns all invoices by attribute" do
    merchant = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice = create_invoice(customer.id, merchant.id, "Shipped")
    item1 = create_item("hammer", 2000, merchant.id)
    item2 = create_item("drill", 2000, merchant.id)
    invoice_item1 = create_invoice_item(item1.id, invoice.id, 4000)
    invoice_item2 = create_invoice_item(item1.id, invoice.id, 2000)
    invoice_item3 = create_invoice_item(item2.id, invoice.id, 2000)

    get "/api/v1/invoice_items/find_all?item_id=#{item1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(InvoiceItem.where(item_id: item1.id).to_json)
  end

  it "returns a invoice by attribute" do
    merchant = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice = create_invoice(customer.id, merchant.id, "Shipped")
    item = create_item("hammer", 2000, merchant.id)
    invoice_item1 = create_invoice_item(item.id, invoice.id, 4000)
    invoice_item2 = create_invoice_item(item.id, invoice.id, 2000)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item1.unit_price}"

    expect(status).to eq(200)
    expect(response.body).to eq(invoice_item1.to_json)
  end

  it "returns a random invoice" do
    merchant = create_merchant("Joey")
    customer = create_customer("Joey", "Banks")
    invoice = create_invoice(customer.id, merchant.id, "Shipped")
    item = create_item("hammer", 2000, merchant.id)
    invoice_item1 = create_invoice_item(item.id, invoice.id, 4000)
    invoice_item2 = create_invoice_item(item.id, invoice.id, 2000)

    get "/api/v1/invoice_items/random"

    expect(status).to eq(200)
  end
end
