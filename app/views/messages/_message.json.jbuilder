json.extract! message, :id, :client_id, :content, :severity, :logtime, :created_at, :updated_at
json.url message_url(message, format: :json)
