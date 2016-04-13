require 'rails_helper'
include ApplicationHelper

RSpec.describe "Invoice customer api" do
  it "returns the customer for a invoice" do
    merchant = create_merchant("Joey")
    customer1 = create_customer("Tina", "Banks")
    customer2 = create_customer("Shawna", "Spanks")
    invoice1 = create_invoice(customer1.id, merchant.id, "Shipped")
    invoice2 = create_invoice(customer2.id, merchant.id, "Shipped")

    get "/api/v1/invoices/#{invoice1.id}/customer"

    customer = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(customer["first_name"]).to eq("Tina")
  end
end
# GET /api/v1/invoices/:id/merchant returns the associated merchant
