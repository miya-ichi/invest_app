class Mypage::AccountsController < Mypage::BaseController
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    if @user.update(account_params)
      redirect_to mypage_account_url, success: 'ユーザー情報を更新しました。'
    else
      flash.now[:danger] = 'ユーザー情報の更新に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
