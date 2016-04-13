class Merchant < ActiveRecord::Base
  has_many :invoices

  def revenue
    { revenue: invoices.paid.joins(:invoice_items).sum("quantity * unit_price") }
  end

  def revenue_by_date(date)
    { revenue: invoices.paid.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price") }
  end
end
