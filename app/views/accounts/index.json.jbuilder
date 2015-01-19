json.array!(@users) do |user|
  json.extract! user, :email, :admin
  json.url account_url(user, format: :json)
end
