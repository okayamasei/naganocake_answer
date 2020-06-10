class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(end_user_id: current_end_user.id)
    @address = Address.new
  end

  def create
    address = current_end_user.addresses.new(address_params)
    if address.save
      redirect_to addresses_index_path
    else
      @address = address
      @addresses = Address.where(end_user_id: current_end_user.id)
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
    unless current_end_user.id == @address.end_user_id
      return redirect_to addresses_index_path
    end
  end

  def update
    @address = Address.find(params[:address][:id])
    unless current_end_user.id == @address.end_user_id
      return redirect_to addresses_index_path
    end
    if @address.update(address_params)
      redirect_to addresses_index_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:zip_code, :address, :destination)
  end
end
