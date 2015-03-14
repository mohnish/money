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
        @bill = current_user.bills.create bill_params
        @bill.update_tags(params[:tags])
        render status: (@bill.valid? ? :created : :unprocessable_entity)
      end

      def update
        current_bill.update bill_params
        current_bill.update_tags(params[:tags])
        render status: (current_bill.valid? ? :ok : :unprocessable_entity)
      end

      def destroy
        current_bill.destroy
        head status: :no_content
      end

      private
        def bill_params
          hash = params.permit(:amount, :name, :next_due_date, :category, :repeat_interval)
          hash[:repeat_interval] = RepeatInterval.find_by(id: params[:repeat_interval]) if params[:repeat_interval]
          hash[:category] = Category.find_by(id: params[:category]) if params[:category]
          hash
        end

        def current_bill
          @bill ||= current_user.bills.find_by(id: params[:id])
        end
    end
  end
end
