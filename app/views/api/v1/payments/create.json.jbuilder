json.extract! @payment, :errors
json.partial! 'api/v1/payments/show', payment: @payment if @payment.persisted?
