class PriceTablesController < ApplicationController
  def create
    @price_table = PriceTable.new(price_table_params)
    if @price_table.save
      redirect_to masters_path
    else
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
