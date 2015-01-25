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
        @bill = create_bill

        if @bill.valid?
          status = :created
        else
          status = :unprocessable_entity
        end

        render status: status
      end

      def update
      end

      def destroy
      end

      private
        def parsed_date
          month, day, year = params[:next_due_date].split('/').map(&:to_i)
          Time.zone.parse("#{day}/#{month}/#{year}") if Date.valid_date?(year, month, day)
        end

        def create_bill
          user = User.find_by(id: params[:user_id])

          user.bills.create do |bill|
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
