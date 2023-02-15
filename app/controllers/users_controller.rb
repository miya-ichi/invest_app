class UsersController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, success: 'ユーザー登録が完了しました。'
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
