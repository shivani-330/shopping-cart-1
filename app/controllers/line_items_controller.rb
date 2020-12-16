class LineItemsController < ApplicationController
  before_action :create_order, only:[:create]

  def create
    @line_item = @order.line_items.new(line_item_params)
    @line_item.user_id = current_user.id
    @line_item.save
  end

  private

    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity)
    end

    def create_order
      @order = current_user.orders.where(status: 0).first
      if @order.present?
         @order = Order.find(params[:order_id])
      else
         @order = Order.create(status: 0)
      end
      @order
    end
end
