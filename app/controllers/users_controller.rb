class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      render :edit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy!
    redirect_to new_user_path
  end

  def verify
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
end
