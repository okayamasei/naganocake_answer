class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_item = OrderItem.find(params[:id])
    if order_item.update(order_item_params)
      redirect_to admin_order_path(order_item.order_id)
    else
      redirect_to admin_order_path(order_item.order)
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(
      :work_status,
    )
  end
end
