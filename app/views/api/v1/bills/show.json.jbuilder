json.partial! 'api/v1/bills/show', bill: @bill

json.payments @bill.payments do |payment|
  json.extract! payment, :id, :amount

  json.payment_source do
    json.extract! payment.payment_source, :id, :name, :type
  end
end
