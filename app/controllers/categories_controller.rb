class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to masters_path
    else
      render 'masters/index'
    end
  end

  def update
    # debugger
    # binding.pry
    categories_params.each do |id, category_param|
      category = Category.find(id)
      category.update(category_param)
    end
    redirect_to masters_path
  end

  private

    def categories_params
      params.permit(categories: %i[id category_name])[:categories]
      # params.require(:categories).permit(:id, :category_name)
    end

    def category_params
      params.require(:category).permit(:category_name).merge(user_id: current_user.id)
    end
end
