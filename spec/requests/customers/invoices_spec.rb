require 'rails_helper'
include ApplicationHelper

RSpec.describe "Customer invoices api" do
  it "returns a customers invoices" do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Bud")
    customer1 = create_customer("Joey", "Banks")
    customer2 = create_customer("Joey", "Banks")
    invoice1 = create_invoice(customer1.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer1.id, merchant1.id, "Shipped")
    invoice3 = create_invoice(customer2.id, merchant1.id, "Shipped")

    get "/api/v1/customers/#{customer1.id}/invoices"

    invoice_count = JSON.parse(response.body).count

    expect(status).to eq(200)
    expect(invoice_count).to eq(2)
  end
end
