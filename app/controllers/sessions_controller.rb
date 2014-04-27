class SessionsController < ApplicationController
  def new
    # render login form
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      session[:user_id] = nil
      @user = User.new
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end
end
