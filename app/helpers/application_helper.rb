module ApplicationHelper
  def selectable_categories
    current_user.categories
  end
end
