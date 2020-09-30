class Estimate < ApplicationRecord
  belongs_to :user
  has_many :estimate_details
end
