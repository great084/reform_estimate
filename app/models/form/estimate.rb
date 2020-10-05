class Form::Estimate < Estimate
  REGISTRABLE_ATTRIBUTES = %i(user_id subject customer_name)
  has_many :estimate_details, class_name: 'Form::EstimateDetail'
  # accepts_nested_attributes_for :estimate_details, allow_destroy: true

  # after_initialize { estimate_details.build unless self.persisted? || estimate_details.present? }
  before_save :calculate_estimate_price

  private

  def calculate_estimate_price
    estimate_details.each(&:calculate_estimate_detail_price)
    self.subtotal = estimate_details.map(&:price).sum
  end
end
