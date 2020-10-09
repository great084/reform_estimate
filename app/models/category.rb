class Category < ApplicationRecord
  belongs_to :user
  has_many :estimate_details
  has_many :price_tables

  validates :user_id, uniqueness: { scope: :category_name}
end
