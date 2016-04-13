require 'csv'

desc "Import sales data from csv files"
task import_data: :environment do

  filename = File.join Rails.root, "db/csv_data/merchants.csv"
  counter = 0

  CSV.foreach(filename, headers: true) do |row|
    merchant = Merchant.create row.to_hash
    counter +=1 if merchant.persisted?
  end
  puts "Imported #{counter} merchants"

  filename = File.join Rails.root, "db/csv_data/customers.csv"
  counter = 0

  CSV.foreach(filename, headers: true) do |row|
    customer = Customer.create row.to_hash
    counter +=1 if customer.persisted?
  end
  puts "Imported #{counter} customers"

  filename = File.join Rails.root, "db/csv_data/items.csv"
  counter = 0

  CSV.foreach(filename, headers: true) do |row|
    item = Item.create(
                        name:         row[1],
                        description:  row[2],
                        unit_price:  (row[3].to_f/100),
                        merchant_id:  row[4],
                        created_at:   row[5],
                        updated_at:   row[6]
                        )
    counter +=1 if item.persisted?
  end
  puts "Imported #{counter} items"

  filename = File.join Rails.root, "db/csv_data/invoices.csv"
  counter = 0

  CSV.foreach(filename, headers: true) do |row|
    invoice = Invoice.create row.to_hash

    counter +=1 if invoice.persisted?
  end
  puts "Imported #{counter} invoices"

  filename = File.join Rails.root, "db/csv_data/transactions.csv"
  counter = 0

  CSV.foreach(filename, headers: true) do |row|
    transaction = Transaction.create row.to_h
     counter +=1 if transaction.persisted?
  end
  puts "Imported #{counter} transactions"

  filename = File.join Rails.root, "db/csv_data/invoice_items.csv"
  counter = 0

  CSV.foreach(filename, headers: true) do |row|
    invoice_item = InvoiceItem.create!(
                                       item_id:     row[1],
                                       invoice_id:  row[2],
                                       quantity:    row[3],
                                       unit_price: (row[4].to_f/100),
                                       created_at:  row[5],
                                       updated_at:  row[6]
                                       )
     counter +=1 if invoice_item.persisted?
  end
  puts "Imported #{counter} invoice_items"
end
