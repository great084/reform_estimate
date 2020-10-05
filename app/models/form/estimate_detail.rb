class Form::EstimateDetail < EstimateDetail
  REGISTRABLE_ATTRIBUTES = 
  %i(id category_id item_name specification unit unit_price quantity price remark _destory)

  def selectable_categories
    Category.all
  end

  def calculate_estimate_detail_price
    self.price = unit_price * quantity
  rescue
    self.price = 0
  end
end
