class Product < ApplicationRecord
  has_many_attached :images
  has_many :line_items
  belongs_to :user
end
