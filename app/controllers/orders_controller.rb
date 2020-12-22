class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def payment_option
  end

  def place_order
    @initial_order = Order.new(order_params)
    @order = current_user.latest_order
    @update_order = current_user.latest_order.update(total_price: @order.total_price, total_quantity: @order.total_quantity, status: 'payment', payment_mode: @initial_order.payment_mode)
    redirect_to orders_path
  end

  def revenue_page
    @total_price_revenue = Order.joins(line_items: :product).where("products.user_id = ? AND orders.status = ?", current_user.id, 1).sum("products.price*quantity")

    @total_quantity_revenue = Order.joins(line_items: :product).where("products.user_id = ? AND orders.status = ?", current_user.id, 1).sum("line_items.quantity")
  end
  
  private
    def order_params
      params.require(:order).permit(:total_price, :total_quantity, :status, :payment_mode)
    end

end
