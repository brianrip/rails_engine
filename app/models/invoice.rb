class Invoice < ActiveRecord::Base
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant

  scope :paid, ->   { joins(:transactions).where( transactions: {result: "success"}) }
  scope :unpaid, -> { joins(:transactions).where( transactions: {result: "failed"}) }
  scope :date_of_invoice, -> date { where(created_at: date) }
end
