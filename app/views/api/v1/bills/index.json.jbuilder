json.array! @bills do |bill|
  json.extract! bill, :id, :name, :next_due_date, :amount

  json.repeat_interval do
    repeat_interval = bill.repeat_interval
    json.id repeat_interval.id
    json.interval repeat_interval.interval
    json.label repeat_interval.label
  end

  json.category do
    category = bill.category
    json.id category.id
    json.name category.name
    json.label category.label
  end
end
