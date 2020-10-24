class RemoveFkToEstimateDetails < ActiveRecord::Migration[6.0]
  def change
    change_table :estimate_details, bulk: true do |t|
      t.remove_foreign_key :categories
      t.remove_foreign_key :estimates
      t.remove_index :category_id
      t.remove_index :estimate_id
      t.column :estimate_category_id, :bigint, null: false
      t.index :estimate_category_id
      t.foreign_key :estimate_categories
    end
    remove_column :estimate_details, :category_id, :bigint
    remove_column :estimate_details, :estimate_id, :bigint
  end
end
