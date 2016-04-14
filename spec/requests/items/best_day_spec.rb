require 'rails_helper'
include ApplicationHelper

RSpec.describe 'Items best day' do
  it 'returns date that item was sold the most times' do
    merchant = create_merchant("Joey")
    customer = create_customer("Tina", "Banks")
    invoice1 = create_invoice(customer.id, merchant.id, "Shipped")
    invoice2 = create_invoice(customer.id, merchant.id, "Shipped")
    invoice3 = create_invoice(customer.id, merchant.id, "Shipped")
    item = create_item("hammer", 200.00, merchant.id)
    transaction1 = create_transaction(invoice1.id, "success")
    transaction2 = create_transaction(invoice2.id, "success")
    transaction3 = create_transaction(invoice2.id, "success")
    invoice_item1 = create_invoice_item(item.id, invoice1.id, 40)
    invoice_item2 = create_invoice_item(item.id, invoice1.id, 20)
    invoice_item2 = create_invoice_item(item.id, invoice2.id, 20)

    get "/api/v1/items/#{item.id}/best_day"

    date = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(date).to eq(invoice1.created_at)
  end
end
# GET /api/v1/items/:id/best_day returns the date with the most sales for the given item using the invoice date# GET /api/v1/items/most_items?quantity=x returns the top x item instances ranked by total number sold
# GET /api/v1/items/most_revenue?quantity=x returns the top x items ranked by total revenue generated
