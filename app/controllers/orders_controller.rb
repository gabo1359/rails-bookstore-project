class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end
    
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.book_id = params[:order][:book_id]
    
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :book_id)
  end
end
