class EstimateDetail < ApplicationRecord
  belongs_to :estimate_category
  REGISTRABLE_ATTRIBUTES =
    %i[estimate_category_id item_name specification unit unit_price quantity price remark _destroy].freeze

  before_validation :calculate_estimate_detail_price

  validates_presence_of :item_name
  validates_presence_of :unit
  validates_presence_of :unit_price
  validates_presence_of :quantity

  private

    def calculate_estimate_detail_price
      self.price = unit_price * quantity
    rescue StandardError
      self.price = 0
    end
end
