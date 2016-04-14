require 'rails_helper'
include ApplicationHelper

RSpec.describe "Invoice merchant api" do
  it "returns the merchant for a invoice" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Greg")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant2.id, "Shipped")

    get "/api/v1/invoices/#{invoice1.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(merchant["name"]).to eq("Joey")
  end
end
