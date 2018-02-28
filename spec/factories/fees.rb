FactoryBot.define do

  factory :fee ,class: Fee do
    date "2017/11/11"
    departure "Somain, France"
    arrival "Fenain, France"
    type_of_trajet true
    kilometer 200
  end

  factory :fee_not_date, class: Fee do
    date nil
    departure "Somain, France"
    arrival "Fenain, France"
    type_of_trajet true
    kilometer 200
  end

  factory :fee_not_departure, class: Fee do
    date "2017/11/11"
    departure nil
    arrival "Fenain, France"
    type_of_trajet true
    kilometer 200
  end

  factory :fee_not_arrival, class: Fee do
    date "2017/11/11"
    departure "Somain, France"
    arrival ""
    type_of_trajet true
    kilometer 200
  end

  factory :fee_not_type_of_trajet, class: Fee do
    date "2017/11/11"
    departure "Somain, France"
    arrival "Fenain, France"
    type_of_trajet nil
    kilometer 200
  end

  factory :fee_not_kilometer, class: Fee do
    date "2017/11/11"
    departure "Somain, France"
    arrival "Fenain, France"
    type_of_trajet true
    kilometer nil
  end
end
