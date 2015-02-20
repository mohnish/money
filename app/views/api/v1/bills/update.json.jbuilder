json.extract! @bill, :errors
json.partial! 'api/v1/bills/show', bill: @bill
