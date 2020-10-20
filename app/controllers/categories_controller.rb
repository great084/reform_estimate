class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[update destroy]

  def index
    @categories = current_user.categories
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    # binding.pry
    if @category.save
      flash[:success] = '登録しました。'
      redirect_to index
    else
      render_index('登録に失敗しました。')
    end
  end

  # 一括更新時の処理
  # def update
  #   # debugger
  #   # binding.pry
  #   categories_params.each do |id, category_param|
  #     category = Category.find(id)
  #     category.update(category_param)
  #   end
  #   redirect_to masters_path
  # end

  def update
    if @category.update(category_params)
      flash[:success] = '更新しました。'
      redirect_to index
    else
      render_index('更新に失敗しました。')
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = '削除しました。'
      redirect_to index
    else
      render_index('削除に失敗しました。')
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    # def categories_params
    #   params.permit(categories: %i[id category_name])[:categories]
    #   # params.require(:categories).permit(:id, :category_name)
    # end

    def category_params
      params.require(:category).permit(:category_name).merge(user_id: current_user.id)
    end

    def render_index(msg)
      flash.now[:alert] = msg
      @categories = current_user.categories
      render 'index'
    end
end
