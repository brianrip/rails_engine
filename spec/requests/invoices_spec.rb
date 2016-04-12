require 'rails_helper'
include ApplicationHelper

RSpec.describe "invoice api" do
  it "returns all invoices" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Bud")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant1.id, "Shipped")

    get "/api/v1/invoices.json"

    expect(status).to eq(200)
    expect(response.body).to eq(Invoice.all.to_json)
  end

  it "returns specific invoice" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Bud")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant1.id, "Shipped")

    get "/api/v1/invoices/#{invoice1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(Invoice.find(invoice1.id).to_json)
  end
end
