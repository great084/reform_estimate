class Estimate < ApplicationRecord
  belongs_to :user
  has_many :estimate_details

  validates :subject, presence: true
  validates :customer_name, presence: true
end
