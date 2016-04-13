require 'rails_helper'
include ApplicationHelper

RSpec.describe "Merchant invoices api" do
  it "returns all invoices for a merchant" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Bud")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice3 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice3 = create_invoice(customer.id, merchant2.id, "Shipped")

    get "/api/v1/merchants/#{merchant1.id}/invoices"

    expect(status).to eq(200)
    expect(response.body).to eq(Invoice.limit(3).to_json)
  end

end
