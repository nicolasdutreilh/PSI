json.recipient do
  json.name @invoice.recipient.name
  json.url polymorphic_url(@invoice.recipient, format: 'json')
end
json.extract! @invoice, :recipient_type, :identifier, :amount, :ordered_at, :shipped_at, :invoiced_at, :delivered_at, :created_at, :updated_at
json.payment_rules do
  json.array!(@invoice.payment_rules) do |payment_rule|
    json.name payment_rule.name
    json.url payment_rule_url(payment_rule, format: :json)
  end
end
