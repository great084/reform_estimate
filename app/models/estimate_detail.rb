class EstimateDetail < ApplicationRecord
  belongs_to :estimate
  belongs_to :category
  REGISTRABLE_ATTRIBUTES = %i(id category_id item_name specification unit unit_price quantity price remark _destroy)


  def selectable_categories(user_id)
    Category.where(user_id: user_id)
  end

  def calculate_estimate_detail_price
    self.price = unit_price * quantity
  rescue
    self.price = 0
  end

end
