class Product < ApplicationRecord
  has_and_belongs_to_many :categories, autosave: true
  has_many :attachments, as: :imageable
  # validations
  validates_presence_of :name, :sku_id
  validates_uniqueness_of :sku_id
end
