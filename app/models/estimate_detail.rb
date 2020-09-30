class EstimateDetail < ApplicationRecord
  belongs_to :estimate
  belongs_to :category
end
