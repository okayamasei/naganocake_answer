class Public::ItemsController < ApplicationController
  def top
  end

  def index
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
    else
      @items = Item.all
    end
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
