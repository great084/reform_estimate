class MastersController < ApplicationController
  def index
    @categories = current_user.categories
    @price_tables = current_user.price_tables.includes(:category)
    # @price_tables = PriceTable.includes(:categories)
    @category = Category.new
    @price_table = PriceTable.new
  end
end
