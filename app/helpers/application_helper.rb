module ApplicationHelper
  def selectable_categories
    current_user.categories
  end

  def selectable_price_tables(category)
    category.price_tables
  end
end
