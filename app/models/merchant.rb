class Merchant < ActiveRecord::Base
  has_many :invoices

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
