json.extract! @client, :identifier, :name, :contact, :address, :country_name, :phone, :fax, :created_at, :updated_at
json.payment_rules do
  json.array!(@client.payment_rules) do |payment_rule|
    json.name payment_rule.name
    json.url payment_rule_url(payment_rule, format: :json)
  end
end
