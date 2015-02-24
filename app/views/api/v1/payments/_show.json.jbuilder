json.extract! payment, :id, :amount, :bill_id

json.payment_date payment.created_at

json.payment_source do
  json.extract! payment.payment_source, :id, :name, :type
end
