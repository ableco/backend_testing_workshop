json.extract! subscription, :id, :user_id, :collection_id, :type, :expiration_date, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
