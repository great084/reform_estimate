class EstimateDetail < ApplicationRecord
  belongs_to :estimate_category
  REGISTRABLE_ATTRIBUTES =
    %i[estimate_category_id item_name specification unit unit_price quantity price remark _destroy].freeze

  def selectable_categories(user_id)
    Category.where(user_id: user_id)
  end

  def calculate_estimate_detail_price
    self.price = unit_price * quantity
  rescue StandardError
    self.price = 0
  end
end
