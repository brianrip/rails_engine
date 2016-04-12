require 'rails_helper'
include ApplicationHelper

RSpec.describe "invoice api" do
  it "returns all invoices" do
    merchant1 = create_merchant("Joey")
    invoice1 = create_invoice("Scissors", 1200, merchant1.id)
    invoice2 = create_invoice("Cape", 1500, merchant1.id)

    get "/api/v1/invoices.json"

    expect(status).to eq(200)
    expect(response.body).to eq(Item.all.to_json)
  end

  it "returns specific invoice" do
    merchant1 = create_merchant("Joey")
    invoice1 = create_invoice("Scissors", 1200, merchant1.id)
    invoice2 = create_invoice("Cape", 1500, merchant1.id)

    get "/api/v1/invoices/#{invoice1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(Item.find(invoice1.id).to_json)
  end
end
