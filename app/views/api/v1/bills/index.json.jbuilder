json.array! @bills do |bill|
  json.extract! bill, :id, :name, :next_due_date, :amount

  json.repeat_interval do
    json.extract! bill.repeat_interval, :id, :interval, :label
  end

  json.category do
    json.extract! bill.category, :id, :name, :label
  end
end
