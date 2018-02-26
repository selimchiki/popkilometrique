class Scale < ApplicationRecord

  has_many :cars

  validates :vehicle_type, presence: true
  validates :fiscal_power, presence: true
  validates :coefficient, presence: true
  validates :active, inclusion: { in: [true, false] }

  enum vehicle_type: [:light_vehicle, :two_weels, :less_than_50_cm3]

  scope :activated, -> {where(active: true)}

  def model_with_fiscal
    "#{vehicle_type}, #{fiscal_power}"
  end



end
