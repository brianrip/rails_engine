require 'rails_helper'
include ApplicationHelper

RSpec.describe "Merchants api" do
  it "returns all merchants" do
    merchant1 = create_merchant("John")
    merchant1 = create_merchant("Cassy")

    get "/api/v1/merchants.json"

    expect(status).to eq(200)
    expect(response.body).to eq(Merchant.all.to_json)
  end

  it "returns specific merchant" do
    merchant1 = create_merchant("Dane")
    merchant2 = create_merchant("Bre")

    get "/api/v1/merchants/#{merchant1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(Merchant.find(merchant1.id).to_json)
  end
end
