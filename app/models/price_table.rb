class PriceTable < ApplicationRecord
  belongs_to :category
  has_many :estimate_detail, dependent: :nullify

  validates :specification, uniqueness: { scope: %i[category_id item_name] }

  def full_item_name
    "#{self.item_name} :  #{self.specification}"
  end

  def selectable_categories(user_id)
    Category.where(user_id: user_id)
  end
end
