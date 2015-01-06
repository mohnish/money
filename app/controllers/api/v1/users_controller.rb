module Api
  module V1
    class UsersController < BaseController
      def show
        # TODO: oauth
        @user = User.find_by(id: params[:id])
      end

      def create
        @user = User.create(user_params)

        status = @user.valid? ? :created : :unprocessable_entity

        render status: status
      end

      def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)

        status = @user.valid? ? :ok : :unprocessable_entity

        render status: status
      end

      def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        head status: :no_content
      end

      private
        def user_params
          params.permit(:username, :first_name, :last_name, :email_address, :phone_number, :password)
        end
    end
  end
end
