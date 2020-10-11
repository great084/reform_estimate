class AddIndexToCategory < ActiveRecord::Migration[6.0]
  def change
    add_index :categories, %i[user_id category_name], unique: true
  end
end
