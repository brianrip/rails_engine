require 'rails_helper'
include ApplicationHelper

RSpec.describe 'Merchants top customer' do
  it 'returns customer with most successful transactions' do
    merchant = create_merchant("Joey")
    customer1 = create_customer("Tina", "Banks")
    customer2 = create_customer("Hank", "Tank")
    invoice1 = create_invoice(customer1.id, merchant.id, "Shipped")
    invoice2 = create_invoice(customer2.id, merchant.id, "Shipped")
    item1 = create_item("hammer", 200.00, merchant.id)
    transaction1 = create_transaction(invoice1.id, "success")
    transaction2 = create_transaction(invoice1.id, "success")
    transaction3 = create_transaction(invoice1.id, "success")
    transaction4 = create_transaction(invoice2.id, "success")
    invoice_item1 = create_invoice_item(item1.id, invoice1.id, 40)
    invoice_item2 = create_invoice_item(item1.id, invoice1.id, 20)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    customer = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(customer["id"]).to eq(customer1.id)
  end
end
