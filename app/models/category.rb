class Category < ApplicationRecord
  belongs_to :user
  has_many :estimate_details, dependent: :destroy
  has_many :price_tables, dependent: :destroy

  validates :user_id, uniqueness: { scope: :name }

  scope :sorted, -> { order(name: :asc) }
end
