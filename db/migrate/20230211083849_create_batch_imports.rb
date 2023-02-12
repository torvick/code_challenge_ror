class CreateBatchImports < ActiveRecord::Migration[7.0]
  def change
    create_table :batch_imports do |t|
      t.integer :total_items
      t.decimal :total_revenue
      t.jsonb :file_data
      t.jsonb :right_information
      t.jsonb :incorrect_information
      t.jsonb :orders

      t.timestamps
    end
  end
end
