require 'rails_helper'
include ApplicationHelper

RSpec.describe "Merchants with most revenue api" do
  it "returns given number of merchants" do
    merchant = create_merchant("Joey")
    merchant = create_merchant("Tonya")
    merchant = create_merchant("Bre")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant.id, "Shipped")
    item1 = create_item("hammer", 2000, merchant.id)
    item2 = create_item("drill", 2000, merchant.id)
    item3 = create_item("saw", 2000, merchant.id)
    invoice_item1 = create_invoice_item(item1.id, invoice1.id, 4000)
    invoice_item2 = create_invoice_item(item1.id, invoice1.id, 2000)
    invoice_item3 = create_invoice_item(item3.id, invoice2.id, 2000)

    x = 2

    # get "/api/v1/merchants/most_revenue?quantity=#{x}"

    # merchants = JSON.parse(response.body)

    # expect(status).to eq(200)
    # expect(item_count).to eq(2)
  end
end
