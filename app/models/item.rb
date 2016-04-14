class Item < ActiveRecord::Base
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items
  belongs_to :merchant

  default_scope { order('id ASC')}

  def best_day
    { best_day: invoices.paid
    .group('"invoices"."created_at"')
    .sum("quantity * unit_price")
    .sort_by { |day| day.last }
    .map { |sorted_day| sorted_day.first }.last }
  end
end
