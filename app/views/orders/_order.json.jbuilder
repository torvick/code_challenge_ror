json.extract! order, :id, :number_of_pieces, :client_id, :seller_id, :product_id, :created_at, :updated_at
json.url order_url(order, format: :json)
