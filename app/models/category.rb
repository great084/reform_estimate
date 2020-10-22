class Category < ApplicationRecord
  belongs_to :user
  has_many :estimate_details, dependent: :destroy
  has_many :price_tables, dependent: :destroy

  validates :user_id, uniqueness: { scope: :category_name }

  Scope :sorted, -> { order(category_name: :asc) }
end
