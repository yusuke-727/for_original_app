json.extract! event, :id, :title, :content, :scheduled_date, :created_at, :updated_at
json.url event_url(event, format: :json)
