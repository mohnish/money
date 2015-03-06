module Api
  module V1
    class ReportsController < BaseController
      def index
        @report = current_user.bills
      end
    end
  end
end
