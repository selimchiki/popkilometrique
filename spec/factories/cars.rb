FactoryBot.define do

  factory :car do
    model "C4"
    scale_id 1
    user_id 1
  end

  factory :car_not_model, class: Car do
    model ""
    scale_id 1
    user_id 1
  end

  factory :car_not_scale, class: Car do
    model "C4"
    user_id 1
  end
end
