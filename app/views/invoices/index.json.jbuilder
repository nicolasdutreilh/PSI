json.array!(@invoices) do |invoice|
  json.recipient do
    json.name invoice.recipient.name
    json.url polymorphic_url(invoice.recipient, format: 'json')
  end
  json.extract! invoice, :identifier, :amount
  json.url invoice_url(invoice, format: :json)
end
