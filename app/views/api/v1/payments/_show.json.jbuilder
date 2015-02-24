json.extract! payment, :id, :amount, :bill_id, :payment_source_id

json.payment_date payment.created_at

json.bill do
  json.extract! payment.bill, :id, :name
end

json.payment_source do
  json.extract! payment.payment_source, :id, :name, :type
end
