module Api
  module V1
    class UsersController < BaseController
      before_action :doorkeeper_authorize!, except: [:create]

      def me
        current_user
      end

      def create
        @current_user = User.create(user_params)

        render status: (@current_user.valid? ? :created : :unprocessable_entity)
      end

      def update
        current_user.update(user_params)

        render status: (current_user.valid? ? :ok : :unprocessable_entity)
      end

      def destroy
        current_user.destroy
        head status: :no_content
      end

      private
        def user_params
          params.permit(:username, :first_name, :last_name, :email_address, :phone_number, :password, :avatar)
        end
    end
  end
end
