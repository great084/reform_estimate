class AddUniqueIndexToEstimateCategories < ActiveRecord::Migration[6.0]
  def change
    change_table :estimate_categories, bulk: true do |t|
      t.index %i[estimate_id category_id], unique: true
    end
  end
end
