 class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  def self.most_revenue(quantity)
    invoices = Invoice.paid
                      .joins(:invoice_items)
                      .select("merchant_id,
                              sum(invoice_items.quantity * invoice_items.unit_price) AS invoice_revenue")
                      .group("invoices.merchant_id")
                      .order("invoice_revenue DESC")
                      .limit(quantity)
    invoices.map { |invoice| Merchant.find(invoice.merchant_id) }
  end


  def revenue
    {
    revenue: invoices.paid
    .joins(:invoice_items)
    .sum("quantity * unit_price")
    }
  end

  def revenue_by_date(date)
    {
    revenue: invoices.paid
    .where(created_at: date)
    .joins(:invoice_items)
    .sum("quantity * unit_price")
    }
  end

  def favorite_customer
    customer_id = invoices.paid.group_by(&:customer_id).max_by do  |k, v|
      v.count
    end.first

    Customer.find(customer_id)
  end

  def customers_with_pending_invoices
    Customer.find(invoices.unpaid.pluck(:customer_id))
  end
end
