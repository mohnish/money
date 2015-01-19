module Api
  module V1
    class BillsController < BaseController
      def index
        user = User.find_by(params[:user_id])
        @bills = user.bills
      end

      def show
        @bill = Bill.last
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
