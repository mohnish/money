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
        update_bill
        render status: (current_bill.valid? ? :ok : :unprocessable_entity)
      end

      def destroy
        current_bill.destroy
        head status: :no_content
      end

      private
        # TODO: Move this into the model
        def update_bill
          update_params = {}
          update_params[:amount] = params[:amount] if params[:amount]
          update_params[:name] = params[:name] if params[:name]
          update_params[:next_due_date] = params[:next_due_date] if params[:next_due_date]
          update_params[:category] = Category.find_by(id: params[:category]) if params[:category]
          update_params[:repeat_interval] = RepeatInterval.find_by(id: params[:repeat_interval]) if params[:repeat_interval]

          params[:tags].map do |tag|
            current_bill.tags.find_or_initialize_by(name: tag)
          end

          current_bill.update(update_params)
        end

        def current_bill
          @bill ||= current_user.bills.find_by(id: params[:id])
        end
    end
  end
end
