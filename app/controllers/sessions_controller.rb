class SessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to login_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_url, notice: 'ログアウトしました。'
  end
end
