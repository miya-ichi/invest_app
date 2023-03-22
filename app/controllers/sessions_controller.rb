class SessionsController < ApplicationController
  before_action :redirect_to_logged_in_root, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_url, success: 'ログインしました。'
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_url, success: 'ログアウトしました。'
  end

  private

  def redirect_to_logged_in_root
    redirect_to possessions_path if logged_in?
  end
end
