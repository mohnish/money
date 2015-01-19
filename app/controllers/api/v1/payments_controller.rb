module Api
  module V1
    class PaymentsController < BaseController
      def create
        bill = Bill.find_by(id: params[:bill_id])
        @payment = bill.payments.create(payment_params)

        status = @payment.valid? ? :created : :unprocessable_entity

        render status: status
      end

      def update
        bill = Bill.find_by(id: params[:bill_id])

        if bill
          @payment = bill.payments.find_by(id: params[:id])
          @payment.update(payment_params)
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
        bill = Bill.find_by(id: params[:bill_id])

        payment = bill.payments.find_by(id: params[:id])
        payment.destroy

        head status: :no_content
      end

      private
        def payment_params
          params.permit(:amount, :payment_source_id)
        end
    end
  end
end
