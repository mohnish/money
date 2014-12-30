module Api
  module V1
    class BillsController < BaseController
      def index
        @bills = Bill.all
      end

      def show
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
