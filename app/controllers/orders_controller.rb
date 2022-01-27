class OrdersController < ApplicationController

  def index
   @orders = policy_scope(Order).order(created_at: :desc)
  end

  def new
    @order = current_user.orders.new
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.book_id = params[:order][:book_id]
    authorize @order
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
