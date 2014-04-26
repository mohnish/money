class SessionsController < ApplicationController
  def new
    # render login form
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to 'users/show'
    else
      session[:user_id] = nil
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to 'users/new'
  end
end
