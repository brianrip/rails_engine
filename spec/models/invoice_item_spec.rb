require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should respond_to(:quantity) }
  it { should respond_to(:unit_price) }
  it { should be_valid }
  it { should belong_to(:item) }
  it { should belong_to(:invoice) }
end
