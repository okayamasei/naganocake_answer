class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @total = 0
    @cart_items.map { |r| @total += r.subtotal }
  end

  def create
    previous_cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], end_user_id: current_end_user.id)
    if previous_cart_item.nil?
      logger.info("新規")
      @cart_item = current_end_user.cart_items.new(cart_item_params)
    else
      logger.info("追加")
      @cart_item = previous_cart_item
      @cart_item.amount += params[:cart_item][:amount].to_i
    end

    if @cart_item.save
      @cart_items = CartItem.where(end_user_id: current_end_user.id)
      redirect_to cart_items_index_path
    else
      redirect_to item_path(params[:cart_item][:item_id])
    end
  end

  def update
    cart_item = CartItem.find_by(id: params[:id], end_user_id: current_end_user.id)
    if cart_item.nil?
      redirect_to cart_items_index_path
    end
    cart_item.update(cart_item_params)
    redirect_to cart_items_index_path
  end

  def destroy
    cart_item = CartItem.find_by(id: params[:id], end_user_id: current_end_user.id)
    if cart_item.destroy
      redirect_to cart_items_index_path
    else
      redirect_to cart_items_index_path
    end
  end

  def destroy_all
    cart_items = CartItem.where(end_user_id: current_end_user.id)
    cart_items.destroy_all
    redirect_to cart_items_index_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
