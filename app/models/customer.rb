class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    merchant_id = invoices.paid.group_by(&:merchant_id).max_by do  |k, v|
      v.count
    end.first

    Merchant.find(merchant_id)
  end
end
