class RenameCategoryNameColumneToCategories < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :category_name, :name
  end
end
