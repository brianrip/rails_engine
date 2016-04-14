require 'rails_helper'
include ApplicationHelper

RSpec.describe 'Customers top merchant' do
  it 'returns merchant where customer completed most successful transactions' do
    merchant1 = create_merchant("Joey")
    merchant2 = create_merchant("Trent")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant1.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant2.id, "Shipped")
    transaction1 = create_transaction(invoice1.id, "success")
    transaction2 = create_transaction(invoice1.id, "success")
    transaction3 = create_transaction(invoice1.id, "success")
    transaction4 = create_transaction(invoice2.id, "success")

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    merchant = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(merchant["id"]).to eq(merchant1.id)
  end
end
