json.array!(@payments) do |payment|
  json.extract! payment, :id, :index, :show, :create, :update, :destroy
  json.url payment_url(payment, format: :json)
end
