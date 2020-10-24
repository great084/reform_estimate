class EstimateCategory < ApplicationRecord
  belongs_to :estimate
  belongs_to :category
  has_many :estimate_details, dependent: :destroy
end
