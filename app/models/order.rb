class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  enum status: [:cart, :payment, :deliver, :shipped, :cancelled]

  before_save :total_price

  def total_price
    line_items.collect {|line_item| line_item.valid? ? (line_item.product.price*line_item.quantity) : 0}.sum
  end

  private

    def set_total_price
      self[:total_price] = total_price
    end
end
