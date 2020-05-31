class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  PER = 10
  def index
    @end_users = EndUser.page(params[:page]).per(PER)
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = "保存しました"
      redirect_to admin_end_user_path(@end_user)
    else
      render edit_admin_end_user_path(@end_user)
    end
  end

  private
  def end_user_params
    params.require(:end_user).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :zip_code,
      :address,
      :tel,
      :email,
      :is_valid,
    )
  end

end
