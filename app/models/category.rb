class Category < ApplicationRecord
  belongs_to :user
  has_many :price_tables, dependent: :restrict_with_error
  has_many :estimate_categories, dependent: :restrict_with_error

  validates :user_id, uniqueness: { scope: :name }

  scope :sorted, -> { order(name: :asc) }
end
