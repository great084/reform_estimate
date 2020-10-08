class AddColumnToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :user_id, :bigint, null: false
  end
end
