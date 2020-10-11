class AddFkToEstimate < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :estimates, :users
    add_index :price_tables, %i[user_id item_name specification], unique: true
  end
end
