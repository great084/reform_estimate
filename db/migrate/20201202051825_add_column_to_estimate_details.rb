class AddColumnToEstimateDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :estimate_details, :price_table_id, :bigint, null: false 
    add_foreign_key :estimate_details, :price_tables
  end
end
