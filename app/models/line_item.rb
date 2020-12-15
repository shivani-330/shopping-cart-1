class LineItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order

  before_save :set_price

  def price
    if persisted?
      self[:price]
    else
      product.price
    end
  end

  private

    def set_price
      self[:price] = price
    end
end
