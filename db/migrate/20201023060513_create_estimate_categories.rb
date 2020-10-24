class CreateEstimateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :estimate_categories do |t|
      t.bigint :estimate_id, null: false
      t.bigint :category_id, null: false
      t.string :name, null: false
      t.integer :subtotal, null: false, default: 0
      t.timestamps
    end

    add_foreign_key 'estimate_categories', 'estimates'
    add_foreign_key 'estimate_categories', 'categories'
  end
end
