module Api
  module V1
    class UsersController < BaseController
      def show
        # TODO: oauth
        @user = User.find_by(id: params[:id])
        head :not_found if @user.blank?
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
