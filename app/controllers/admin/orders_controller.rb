class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  PER = 10
  def index
    @orders = Order.order(id: "DESC").page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      render 'show'
    end
  end

  private
  def order_params
    params.require(:order).permit(
      :order_status,
    )
  end
end
