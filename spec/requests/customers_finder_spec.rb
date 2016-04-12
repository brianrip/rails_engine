require 'rails_helper'
include ApplicationHelper

RSpec.describe "Customers finder api" do
  it "returns all customers by attribute" do
    customer1 = create_customer("John", "James")
    customer2 = create_customer("John", "Jones")
    customer3 = create_customer("Cassy", "Caper")

    get "/api/v1/customers/find_all?first_name=John"

    expect(status).to eq(200)
    expect(response.body).to eq(Customer.where(first_name: "John").to_json)
  end

  it "returns a customer by attribute" do
    customer1 = create_customer("John", "Kobe")
    customer2 = create_customer("Cassy", "Jade")

    get "/api/v1/customers/find?last_name=Jade"

    expect(status).to eq(200)
    expect(response.body).to eq(customer2.to_json)
  end

  it "returns a random customer" do
    customer1 = create_customer("John", "Kobe")
    customer2 = create_customer("Cassy", "Jade")

    get "/api/v1/customers/random"

    expect(status).to eq(200)
  end
end
