require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should respond_to(:name) }
  it { should respond_to(:unit_price) }
  it { should respond_to(:description) }
  it { should be_valid }
  it { should belong_to(:merchant) }
  it { should have_many(:invoice_items) }
end
