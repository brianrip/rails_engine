require 'rails_helper'
include ApplicationHelper

RSpec.describe "customer api" do
  it "returns all customers" do
    customer1 = create_customer("John", "Mosely")
    customer1 = create_customer("Cassy", "Caper")

    get "/api/v1/customers.json"

    expect(status).to eq(200)
    expect(response.body).to eq(Customer.all.to_json)
  end

  it "returns specific customer" do
    customer1 = create_customer("Dane", "Kolbaba")
    customer2 = create_customer("Bre", "Coombe")

    get "/api/v1/customers/#{customer1.id}"

    expect(status).to eq(200)
    expect(response.body).to eq(Customer.find(customer1.id).to_json)
  end
end
