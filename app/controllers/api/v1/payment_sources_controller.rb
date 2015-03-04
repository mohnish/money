module Api
  module V1
    class PaymentSourcesController < BaseController
      before_action :doorkeeper_authorize!

      def index
        @payment_sources = current_user.payment_sources
      end

      def create
        @payment_source = current_user.payment_sources.create(payment_source_params)
        status = @payment_source.valid? ? :created : :unprocessable_entity
        render status: status
      end

      def update
        current_payment_source.update(payment_source_params)
        render status: current_payment_source.valid? ? :ok : :unprocessable_entity
      end

      def destroy
        current_payment_source.destroy
        head status: :no_content
      end

      private
        def current_payment_source
          @payment_source ||= current_user.payment_sources.find_by(id: params[:id])
        end

        def payment_source_params
          params.permit(:name, :type)
        end
    end
  end
end
