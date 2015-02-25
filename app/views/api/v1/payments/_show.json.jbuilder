json.extract! payment, :id, :amount

json.payment_date payment.created_at

json.bill do
  json.extract! payment.bill, :id, :name, :amount
end

json.payment_source do
  json.extract! payment.payment_source, :id, :name, :type
end
