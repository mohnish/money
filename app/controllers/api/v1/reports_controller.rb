module Api
  module V1
    class ReportsController < BaseController
      def monthly
        @payments = Payment.joins(:bill).where({
          bills: { user_id: current_user.id },
          created_at: date_range
        })
      end

      private
        def date_range start_date = Time.now, end_date = Time.now
          start_date.beginning_of_month..end_date.end_of_month
        end
    end
  end
end
