class Public::UsersController < ApplicationController
  before_action :authenticate_end_user!
  def show
  end

  def edit
    @end_user = EndUser.find(current_end_user.id)
  end

  def update
    @end_user = EndUser.find(current_end_user.id)
    if @end_user.update(end_user_params)
      flash[:notice] = "保存しました"
      redirect_to users_show_path
    else
      render 'edit'
    end
  end

  def confirm
  end

  def destroy
    end_user = EndUser.find(current_end_user.id)
    if end_user.update(is_valid: "invalid_user")
      reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    else
      flash[:notice] = "退会に失敗しました。大変お手数ですが管理者に問い合わせを行ってください。"
      render users_edit_path
    end
  end

  private
  def end_user_params
    params.require(:end_user).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :email,
      :zip_code,
      :address,
      :tel,
    )
  end

end
