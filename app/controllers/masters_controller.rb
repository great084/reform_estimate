class MastersController < ApplicationController
  def index
    @categories = current_user.categories
    @price_tables = current_user.price_tables
    @category = Category.new
  end
end