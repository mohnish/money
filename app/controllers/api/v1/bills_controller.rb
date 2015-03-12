module Api
  module V1
    class BillsController < BaseController
      before_action :doorkeeper_authorize!

      def index
        @bills = current_user.bills.order('next_due_date')
      end

      def show
        current_bill
      end

      def create
        @bill = current_user.create_bill params
        render status: (@bill.valid? ? :created : :unprocessable_entity)
      end

      def update
        current_bill.update_bill params
        render status: (current_bill.valid? ? :ok : :unprocessable_entity)
      end

      def destroy
        current_bill.destroy
        head status: :no_content
      end

      private
        def current_bill
          @bill ||= current_user.bills.find_by(id: params[:id])
        end
    end
  end
end
