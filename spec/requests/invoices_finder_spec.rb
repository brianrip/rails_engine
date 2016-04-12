require 'rails_helper'
include ApplicationHelper

RSpec.describe "Invoice finder api" do
  it "returns all invoices by attribute" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Bud")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice3 = create_invoice(customer.id, merchant2.id, "Shipped")

    get "/api/v1/invoices/find_all?merchant_id=#{merchant1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(Invoice.where(merchant_id: merchant1.id).to_json)
  end

  it "returns a invoice by attribute" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Bud")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice3 = create_invoice(customer.id, merchant2.id, "Shipped")

    get "/api/v1/invoices/find?merchant_id=#{merchant2.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(invoice3.to_json)
  end

  it "returns a random invoice" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Bud")
    customer = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice3 = create_invoice(customer.id, merchant2.id, "Shipped")

    get "/api/v1/invoices/random"

    expect(status).to eq(200)
  end
end
