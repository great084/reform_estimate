class PriceTable < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :specification, uniqueness: {scope: [:user_id, :item_name] }
end
