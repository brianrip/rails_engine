require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should be_valid }
  it { should have_many(:invoices) }
  it { should have_many(:transactions) }
end
