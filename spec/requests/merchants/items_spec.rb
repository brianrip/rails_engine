require 'rails_helper'
include ApplicationHelper

RSpec.describe "Merchant items api" do
  it "returns all items for a merchant" do
    merchant = create_merchant("John")
    item1 = create_item("Cape", 1500, merchant.id)
    item2 = create_item("Sword", 2500, merchant.id)
    item3 = create_item("Shield", 3500, merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(status).to eq(200)
    expect(response.body).to eq(Item.all.to_json)
  end

end
