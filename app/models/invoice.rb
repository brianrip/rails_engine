class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :paid, -> { joins(:transactions).where( transactions: {result: "success"}) }
  scope :date_of_invoice, -> date { where(created_at: date) }
end
