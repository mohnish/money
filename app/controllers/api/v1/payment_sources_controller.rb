module Api
  module V1
    class PaymentSourcesController < BaseController
      def index
        # TODO: oauth
        @payment_sources = PaymentSource.all
      end

      def create
        @payment_source = PaymentSource.create(payment_source_params)

        status = @payment_source.valid? ? :created : :unprocessable_entity

        render status: status
      end

      def update
      end

      def destroy
      end

      private
        def payment_source_params
          params.permit(:name, :type, :user_id)
        end
    end
  end
end
