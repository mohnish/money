module Api
  module V1
    class UsersController < BaseController
      def show
        # TODO: oauth
        @user = User.find_by(id: params[:id])
      end

      def create
        @user = User.create(user_params)

        if @user.valid?
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      def update
      end

      def destroy
      end

      private
        def user_params
          params.permit(:username, :first_name, :last_name, :email_address, :phone_number, :password)
        end
    end
  end
end
