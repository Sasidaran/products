require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it { should have_and_belong_to_many(:products) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
