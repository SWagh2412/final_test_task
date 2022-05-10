json.extract! beer, :id, :beer_type, :stock, :created_at, :updated_at
json.url beer_url(beer, format: :json)
