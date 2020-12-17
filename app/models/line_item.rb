class LineItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order

  before_save :set_price
  before_save :set_total_price

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

    def set_total_price
      self[:price] = quantity * set_price
    end
end
