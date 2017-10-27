json.extract! client, :id, :name, :auth_key, :description, :created_at, :updated_at
json.url client_url(client, format: :json)
