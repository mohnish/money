json.array!(@bills) do |bill|
  json.extract! bill, :id, :index, :show, :create, :update, :destroy
  json.url bill_url(bill, format: :json)
end
