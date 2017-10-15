class Scale < ApplicationRecord

  belongs_to :car

  def model_with_fiscal
    "#{vehicle_type}, #{fiscal_power}"
  end

  scope :activated, -> {where(active: true)}

end
