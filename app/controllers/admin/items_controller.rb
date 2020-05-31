class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.fetch_valid
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "作成しました"
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.fetch_valid
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "変更を保存しました"
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render "edit"
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :genre_id,
      :name,
      :description,
      :image,
      :price,
      :sales_status,
    )
  end
end
