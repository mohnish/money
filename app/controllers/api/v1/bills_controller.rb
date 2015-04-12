module Api
  module V1
    class BillsController < BaseController
      before_action :doorkeeper_authorize!

      def index
        @bills = current_user.bills.order(status: :asc, next_due_date: :asc)
      end

      def show
        current_bill
      end

      def create
        @bill = current_user.bills.create bill_params
        @bill.payments.create(payment_source_id: params[:payment_source_id], amount: params[:amount]) if repeat_interval.try(:one_time?)
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
          hash[:next_due_date] = next_due_date if params[:next_due_date]
          hash[:repeat_interval] = repeat_interval if params[:repeat_interval]
          hash[:category] = category if params[:category]
          hash
        end

        def repeat_interval
          RepeatInterval.find_by(id: params[:repeat_interval])
        end

        def category
          Category.find_by(id: params[:category])
        end

        def next_due_date
          Time.zone.parse(params[:next_due_date])
        end

        def current_bill
          @bill ||= current_user.bills.find_by(id: params[:id])
        end
    end
  end
end
