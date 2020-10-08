class AddFkToCategory < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key "categories", "users"    
  end
end
