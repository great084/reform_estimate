class Estimate < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i[user_id subject customer_name].freeze

  belongs_to :user
  # has_many :estimate_details, dependent: :destroy
  has_many :estimate_categories, dependent: :destroy

  # accepts_nested_attributes_for :estimate_details, allow_destroy: true
  accepts_nested_attributes_for :estimate_categories, allow_destroy: true
  # before_validation :calculate_estimate_price

  validates :subject, presence: true
  validates :customer_name, presence: true

  # def calculate_estimate_price
  #   estimate_details.each(&:calculate_estimate_detail_price)
  #   self.subtotal = estimate_details.map { |ed| ed.price unless ed.marked_for_destruction? }.compact.sum
  # end
end
