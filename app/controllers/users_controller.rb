class UsersController < ApplicationController
  def new
    # render signup form
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to 'users/show'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    # render edit template
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
  end

  def verify
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
end
