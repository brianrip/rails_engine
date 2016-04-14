class Item < ActiveRecord::Base
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items
  belongs_to :merchant

  default_scope { order('id ASC')}

  def best_day
    {
     best_day: invoices.paid.select("invoices.created_at",
     "SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue")
     .group('created_at').reorder('total_revenue DESC')
     .first.created_at
     }
    end
end
