module Api
  module V1
    class RepeatIntervalsController < BaseController
      before_action :doorkeeper_authorize!

      def index
        @repeat_intervals = RepeatInterval.all
        render status: :ok
      end
    end
  end
end
