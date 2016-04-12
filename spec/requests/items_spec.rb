require 'rails_helper'
include ApplicationHelper

RSpec.describe "item api" do
  it "returns all items" do
    merchant1 = create_merchant("Joey")
    item1 = create_item("Scissors", 1200, merchant1.id)
    item2 = create_item("Cape", 1500, merchant1.id)

    get "/api/v1/items.json"

    expect(status).to eq(200)
    expect(response.body).to eq(Item.all.to_json)
  end

  it "returns specific item" do
    merchant1 = create_merchant("Joey")
    item1 = create_item("Scissors", 1200, merchant1.id)
    item2 = create_item("Cape", 1500, merchant1.id)

    get "/api/v1/items/#{item1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(Item.find(item1.id).to_json)
  end
end
