module Api
  module V1
    class PaymentsController < BaseController
      before_action :doorkeeper_authorize!

      def index
        @payments = current_bill.payments
        render status: :ok
      end

      def create
        @payment = current_bill.payments.create(payment_params)

        render status: (@payment.valid? ? :created : :unprocessable_entity)
      end

      def update
        # TODO: Refactor this!
        if current_bill
          current_payment.update(payment_params)
        else
          status = :unprocessable_entity
        end

        @payment ||= Payment.new

        if @payment.persisted? && @payment.valid?
          status = :ok
        else
          status = :unprocessable_entity
        end

        render status: status
      end

      def destroy
        current_payment.destroy
        head status: :no_content
      end

      private
        def current_payment
          @payment ||= current_bill.payments.find_by(id: params[:id])
        end

        def current_bill
          @bill ||= current_user.bills.find_by(id: params[:bill_id])
        end

        def payment_params
          params.permit(:amount, :payment_source_id)
        end
    end
  end
end
