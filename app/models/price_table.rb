class PriceTable < ApplicationRecord
  belongs_to :category

  validates :specification, uniqueness: { scope: %i[category_id item_name] }

  def selectable_categories(user_id)
    Category.where(user_id: user_id)
  end
end
