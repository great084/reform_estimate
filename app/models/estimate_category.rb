class EstimateCategory < ApplicationRecord
  belongs_to :estimate
  belongs_to :category
  has_many :estimate_details, dependent: :destroy

  validates :category_id, uniqueness: { scope: :estimate_id }

  REGISTRABLE_ATTRIBUTES =
    %i[id category_id name subtotal remark _destroy].freeze

  before_validation :set_name_value
  after_commit do
    estimate.calculate_total
  end

  def calculate_subtotal
    # binding.pry
    self.subtotal = estimate_details.map(&:price).compact.sum
    self.save
  end

  private

    def set_name_value
      self.name = Category.find(category_id).name
    end
end
