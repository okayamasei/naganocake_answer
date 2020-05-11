class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!
  def index
    @orders = Order.where(end_user_id: current_end_user.id).order(id: "DESC")
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @addresses = Address.where(end_user_id: current_end_user.id)
    @address = Address.new
  end

  def create
  end

  def confirm
    @order = current_end_user.orders.new(order_params)
    session[:is_registration] = nil
    case @order.address_status
    when "self" then
      @order.zip_code    = current_end_user.zip_code
      @order.address     = current_end_user.address
      @order.destination = current_end_user.full_name
    when "registered" then
      address = Address.find_by(id: @order.address_id, end_user_id: current_end_user.id)
      @order.zip_code    = address.zip_code
      @order.address     = address.address
      @order.destination = address.destination
    when "registration" then
      if @order.valid?
        session[:is_registration] = true
      else
        @addresses = Address.where(end_user_id: current_end_user.id)
        @address = Address.new
        render 'new'
      end
    else
      redirect_to public_orders_new_path
    end
    session[:order] = @order
    @order.amount = @order.postage
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @cart_items.map { |r| @order.amount += r.subtotal }
  end

  def complete
    order = Order.new(session[:order])
    ActiveRecord::Base.transaction do
      order.save!
      cart_items = CartItem.where(end_user_id: current_end_user.id)
      cart_items.each do |cart_item|
        order_item = OrderItem.new({
          order_id: order.id,
          item_id: cart_item.item_id,
          amount: cart_item.amount,
          price: cart_item.item.price,
          tax_rate: cart_item.item.tax_rate,
        })
        order_item.save!
        cart_item.destroy!
      end
      if session[:is_registration]
        current_end_user.addresses.new({
          zip_code: order.zip_code,
          address: order.address,
          destination: order.destination,
        }).save!
        session.delete(:is_registration)
      end
      session.delete(:order)
    end
  end

  private
  def order_params
    params.require(:order).permit(
      :zip_code,
      :address,
      :destination,
      :pay_type,
      :order_status,
      :postage,
      :amount,
      :address_status,
      :address_id
    )
  end
end
