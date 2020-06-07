class Public::ItemsController < ApplicationController
  # before_action :authenticate_end_user!, only: [:index, :show]
  def top
  end

  def index
    @items = Item.where(sales_status: 'sale')
    if params[:genre_id].present?
      @items = @items.where(genre_id: params[:genre_id])
      @genre = Genre.find(params[:genre_id])
    end
    @genres = Genre.fetch_valid
  end

  def show
    @genres = Genre.fetch_valid
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
