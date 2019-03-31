require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_and_belong_to_many(:categories) }
  it { should have_many(:attachments)}
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:sku_id) }
  it { should validate_uniqueness_of(:sku_id) }
end
