class Mypage::AccountsController < Mypage::BaseController
  def show
    @user = User.find(current_user.id)
  end

  def edit
  end
end
