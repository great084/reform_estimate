class RenameToPriceTables < ActiveRecord::Migration[6.0]
  def change
    change_table :price_tables, bulk: true do |t|
      t.remove_foreign_key :users
      t.remove_index %i[user_id item_name specification]
      t.index %i[category_id item_name specification], unique: true, name: 'price_tables_uk'
    end
    remove_column :price_tables, :user_id, :bigint
  end
end
