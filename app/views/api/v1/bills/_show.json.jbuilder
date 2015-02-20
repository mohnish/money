json.extract! bill, :id, :name, :next_due_date, :amount

json.repeat_interval do
  json.extract! (bill.repeat_interval || RepeatInterval.new), :id, :interval, :label
end

json.category do
  json.extract! (bill.category || Category.new), :id, :name, :label
end

json.tags bill.tags do |tag|
  json.extract! tag, :id, :name
end
