class PriceTablesController < ApplicationController
  def create
    # binding.pry
    @price_table = PriceTable.new(price_table_params)
    if @price_table.save
      redirect_to masters_path
    else
      render 'masters/index'
    end
  end

  def update
    # binding.pry
    @price_table = PriceTable.find(params[:id])
    if @price_table.update(price_table_params)
      redirect_to masters_path
    else
      # ここのエラー時の処理は要改善。masters/indexでは@price_tables（複数）をレンダリングしているため
      render 'masters/index'
    end
  end

  private

  def price_table_params
    params
      .require(:price_table)
      .permit(:category_id, :item_name, :specification, :unit, :unit_price, :remark)
      .merge(user_id: current_user.id)
  end
end
