class Estimate < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i[user_id subject customer_name].freeze
  TAX_RATE = 10

  belongs_to :user
  # has_many :estimate_details, dependent: :destroy
  has_many :estimate_categories, dependent: :destroy

  # accepts_nested_attributes_for :estimate_details, allow_destroy: true
  accepts_nested_attributes_for :estimate_categories, allow_destroy: true
  # before_validation :calculate_estimate_price

  validates :subject, presence: true
  validates :customer_name, presence: true

  def calculate_total
    # binding.pry
    self.subtotal = estimate_categories.map(&:subtotal).compact.sum
    self.consumption_tax = subtotal * TAX_RATE / 100
    self.grand_total = subtotal + consumption_tax
    self.save
  end
end
