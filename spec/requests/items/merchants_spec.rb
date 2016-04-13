require 'rails_helper'
include ApplicationHelper

RSpec.describe "items merchant api" do
  it "returns merchant for an item" do
    merchant1 = create_merchant("Joey")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    item1 = create_item("hammer", 2000, merchant1.id)
    item2 = create_item("drill", 2000, merchant1.id)
    item3 = create_item("saw", 2000, merchant1.id)
    invoice_item1 = create_invoice_item(item1.id, invoice1.id, 4000)

    get "/api/v1/items/#{item1.id}/merchant"
    merchant = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(merchant["name"]).to eq("Joey")
  end
end
