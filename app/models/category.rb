class Category < ApplicationRecord
  belongs_to :user
  has_many :estimate_details
  has_many :price_tables
end
