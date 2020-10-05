class Estimate < ApplicationRecord
  belongs_to :user
  has_many :estimate_details
  accepts_nested_attributes_for :estimate_details, reject_if: :all_blank, allow_destroy: true

  validates :subject, presence: true
  validates :customer_name, presence: true
end
