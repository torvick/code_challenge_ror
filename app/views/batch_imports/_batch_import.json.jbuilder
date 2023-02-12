json.extract! batch_import, :id, :total_items, :total_revenue, :file_data, :right_information, :incorrect_information, :order_id, :created_at, :updated_at
json.url batch_import_url(batch_import, format: :json)
