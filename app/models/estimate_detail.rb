class EstimateDetail < ApplicationRecord
  belongs_to :estimate_category
  belongs_to :price_table
  REGISTRABLE_ATTRIBUTES =
    %i[price_table_id estimate_category_id
       item_name specification unit unit_price quantity price remark _destroy].freeze

  before_validation :autoset_items
  after_commit do
    estimate_category.calculate_subtotal
  end

  with_options presence: true do
    validates :item_name
    validates :unit
    validates :unit_price
    validates :quantity
  end

  private

    # def price=
    #   binding.pry
    #   begin
    #     self.price = unit_price * quantity
    #   rescue StandardError
    #     self.price = 0
    #   end
    # end

    def autoset_items
      self.item_name = price_table.item_name
      self.specification = price_table.specification
      self.price = unit_price * quantity
    end
end
