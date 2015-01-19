json.array!(@suppliers) do |supplier|
  json.extract! supplier, :identifier, :name, :contact_name, :contact_mail, :phone
  json.url supplier_url(supplier, format: :json)
end
