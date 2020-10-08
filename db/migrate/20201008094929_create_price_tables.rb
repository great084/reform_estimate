class CreatePriceTables < ActiveRecord::Migration[6.0]
  def change
    create_table :price_tables do |t|
      t.bigint :user_id, null: false
      t.bigint :category_id, null: false
      t.string :item_name, null: false
      t.string :specification
      t.string :unit
      t.integer :unit_price, null: false
      t.string :remark
      t.timestamps
    end
    add_foreign_key "price_tables", "users"
    add_foreign_key "price_tables", "categories"
  end
end
