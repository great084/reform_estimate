class Estimate < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(user_id subject customer_name)
  belongs_to :user
  has_many :estimate_details, dependent: :destroy
  accepts_nested_attributes_for :estimate_details, allow_destroy: true
  before_validation :calculate_estimate_price

  validates :subject, presence: true
  validates :customer_name, presence: true

  private

  def calculate_estimate_price
    estimate_details.each(&:calculate_estimate_detail_price)
    self.subtotal = estimate_details.map(&:price).sum
  end

end
