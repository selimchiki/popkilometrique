FactoryBot.define do

  factory :scale do
    vehicle_type 0
    fiscal_power "2CV"
    coefficient 0.31
    active true
  end

  factory :scale_not_vehicle_type, class: Scale do
    vehicle_type nil
    fiscal_power "2CV"
    coefficient 0.31
    active true
  end

  factory :scale_not_fiscal_power, class: Scale do
    vehicle_type 0
    fiscal_power nil
    coefficient 0.31
    active true
  end

  factory :scale_not_coefficient, class: Scale do
    vehicle_type 0
    fiscal_power "2CV"
    coefficient nil
    active true
  end


  factory :scale_not_active, class: Scale do
    vehicle_type 0
    fiscal_power "2CV"
    coefficient 0.31
    active nil
  end

end
