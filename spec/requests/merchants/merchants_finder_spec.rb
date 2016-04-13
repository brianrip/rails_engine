require 'rails_helper'
include ApplicationHelper

RSpec.describe "Merchants finder api" do
  it "returns all merchants by attribute" do
    merchant1 = create_merchant("John")
    merchant2 = create_merchant("John")
    merchant3 = create_merchant("Cassy")

    get "/api/v1/merchants/find_all?name=John"

    expect(status).to eq(200)
    expect(response.body).to eq(Merchant.where(name: "John").to_json)
  end

  it "returns a merchant by attribute" do
    merchant1 = create_merchant("John")
    merchant2 = create_merchant("Cassy")

    get "/api/v1/merchants/find?name=John"

    expect(status).to eq(200)
    expect(response.body).to eq(merchant1.to_json)
  end

  it "returns a random merchant" do
    merchant1 = create_merchant("John")
    merchant2 = create_merchant("Cassy")

    get "/api/v1/merchants/random"

    expect(status).to eq(200)
  end
end
