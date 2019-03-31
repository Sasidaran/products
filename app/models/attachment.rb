class Attachment < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  validates_presence_of :img_path
end
