class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to dashboard_url, success: 'ユーザー登録が完了しました。'
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
