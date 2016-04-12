require 'rails_helper'
include ApplicationHelper

RSpec.describe "Item finder api" do
  it "returns all items by attribute" do
    merchant1 = create_merchant("Joey")
    item1 = create_item("Scissors", 1200, merchant1.id)
    item2 = create_item("Cape", 1500, merchant1.id)
    item3 = create_item("Cape", 1600, merchant1.id)

    get "/api/v1/items/find_all?name=Cape"

    expect(status).to eq(200)
    expect(response.body).to eq(Item.where(name: "Cape").to_json)
  end

  it "returns a item by attribute" do
    merchant1 = create_merchant("Joey")
    item1 = create_item("Scissors", 1200, merchant1.id)
    item2 = create_item("Cape", 1500, merchant1.id)

    get "/api/v1/items/find?unit_price=1200"

    expect(status).to eq(200)
    expect(response.body).to eq(item1.to_json)
  end

  it "returns a random item" do
    merchant1 = create_merchant("Joey")
    item1 = create_item("Scissors", 1200, merchant1.id)
    item2 = create_item("Cape", 1500, merchant1.id)

    get "/api/v1/items/random"

    expect(status).to eq(200)
  end
end
