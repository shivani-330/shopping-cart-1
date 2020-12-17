class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  enum status: [:cart, :payment, :deliver, :shipped, :cancelled]
end
