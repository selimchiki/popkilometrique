class Scale < ApplicationRecord

  has_many :cars

  validates :vehicle_type, presence: true
  validates :fiscal_power, presence: true
  validates :coefficient, presence: true
  validates :active, inclusion: { in: [true, false] }

  def model_with_fiscal
    "#{vehicle_type}, #{fiscal_power}"
  end

  scope :activated, -> {where(active: true)}

end
