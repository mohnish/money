module Api
  module V1
    class BillsController < BaseController
      def index
        user = User.find_by(params[:user_id])
        @bills = user.bills
      end

      def show
        user = User.find_by(params[:user_id])
        @bill = user.bills.find_by(params[:id])
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
