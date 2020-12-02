class EstimateDetail < ApplicationRecord
  belongs_to :estimate_category
  belongs_to :price_table
  REGISTRABLE_ATTRIBUTES =
    %i[price_table_id estimate_category_id
       item_name specification unit unit_price quantity price remark _destroy].freeze

  before_validation :calculate_estimate_detail_price
  before_validation :set_item_name_specification

  with_options presence: true do
    validates :item_name
    validates :unit
    validates :unit_price
    validates :quantity
  end

  private

    def calculate_estimate_detail_price
      self.price = unit_price * quantity
    rescue StandardError
      self.price = 0
    end

    def set_item_name_specification
      self.item_name = price_table.item_name
      self.specification = price_table.specification
    end
end
