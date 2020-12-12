class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  enum status: [:cart, :payment, :deliver, :shipped, :cancelled]


  def total_price
    (line_items.price * line_items.quantity).sum
  end

  def total_quantity
    line_items.quantity
  end
end
