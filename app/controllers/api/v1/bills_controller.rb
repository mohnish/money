module Api
  module V1
    class BillsController < BaseController
      before_action :doorkeeper_authorize!

      def index
        @bills = current_user.bills
      end

      def show
        current_bill
      end

      def create
        @bill = create_bill

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
        def update_bill
          update_params = {}
          update_params[:amount] = params[:amount] if params[:amount]
          update_params[:name] = params[:name] if params[:name]
          update_params[:next_due_date] = parsed_date if params[:next_due_date]
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

        def parsed_date
          month, day, year = params[:next_due_date].split('/').map(&:to_i)
          Time.zone.parse("#{day}/#{month}/#{year}") if Date.valid_date?(year, month, day)
        end

        def create_bill
          current_user.bills.create do |bill|
            bill.amount = params[:amount]
            bill.name = params[:name]
            bill.next_due_date = parsed_date
            bill.repeat_interval = RepeatInterval.find_by(id: params[:repeat_interval])
            bill.category = Category.find_by(id: params[:category])

            params[:tags].map do |tag|
              bill.tags.find_or_initialize_by(name: tag)
            end
          end
        end
    end
  end
end
