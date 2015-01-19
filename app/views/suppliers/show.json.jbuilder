json.extract! @supplier, :identifier, :name, :address, :country_name, :shipping_address, :contact_name, :contact_mail, :phone, :fax, :created_at, :updated_at
json.payment_rules do
  json.array!(@supplier.payment_rules) do |payment_rule|
    json.name payment_rule.name
    json.url payment_rule_url(payment_rule, format: :json)
  end
end
