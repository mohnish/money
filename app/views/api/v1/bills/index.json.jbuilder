json.array! @bills do |bill|
  json.extract! bill, :id, :name, :next_due_date, :amount

  json.repeat_interval do
    json.id bill.repeat_interval.id
    json.interval bill.repeat_interval.interval
  end

  json.category do
    json.id bill.category.id
    json.name bill.category.name
    json.label bill.category.label
  end
end
