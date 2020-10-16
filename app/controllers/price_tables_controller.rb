class PriceTablesController < ApplicationController
  before_action :set_price_table, only: %i[update destroy]

  def index
    @price_tables = current_user.price_tables
    @price_table = PriceTable.new
  end

  def create
    # binding.pry
    @price_table = PriceTable.new(price_table_params)
    # binding.pry
    if @price_table.save
      flash[:success] = '登録しました。'
      redirect_to price_tables_path
    else
      render_index('登録に失敗しました。')
    end
  end

  def update
    # binding.pry
    if @price_table.update(price_table_params)
      flash[:success] = '更新しました。'
      redirect_to index
    else
      render_index('更新に失敗しました。')
    end
  end

  def destroy
    if @price_table.destroy
      flash[:success] = '削除しました。'
      redirect_to index
    else
      render_index('削除に失敗しました。')
    end
  end

  private

    def set_price_table
      @price_table = PriceTable.find(params[:id])
    end

    def price_table_params
      params
        .require(:price_table)
        .permit(:category_id, :price_table_id, :item_name, :specification, :unit, :unit_price, :remark)
        .merge(user_id: current_user.id)
    end

    def render_index(msg)
      flash.now[:alert] = msg
      @price_tables = current_user.price_tables
      render 'index'
    end
end
