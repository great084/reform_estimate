class EstimateCategory < ApplicationRecord
  belongs_to :estimate
  belongs_to :category
  has_many :estimate_details, dependent: :destroy

  REGISTRABLE_ATTRIBUTES =
    %i[id category_id name subtotal remark _destroy].freeze

  before_validation :set_name_value

  private

    def set_name_value
      self.name = Category.find(category_id)
    end
end
