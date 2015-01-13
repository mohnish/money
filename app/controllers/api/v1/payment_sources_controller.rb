module Api
  module V1
    class PaymentSourcesController < BaseController
      def index
        # TODO: oauth
        @payment_sources = PaymentSource.all
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
