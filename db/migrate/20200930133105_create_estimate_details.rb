class CreateEstimateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :estimate_details do |t|
      t.bigint :estimate_id, null: false
      t.bigint :category_id, null: false
      t.string :item_name, null: false
      t.string :specification
      t.string :unit
      t.integer :unit_price, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.string :remark
      t.timestamps
    end
    add_foreign_key 'estimate_details', 'estimates'
    add_foreign_key 'estimate_details', 'categories'
  end
end
