json.extract! product, :id, :description, :price_per_piece, :created_at, :updated_at
json.url product_url(product, format: :json)
