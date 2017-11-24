FactoryBot.define do
  factory :fee ,class: Fee do
    date "2017/11/11"
    departure "Somain, France"
    arrival "Fenain, France"
    type_of_trajet true
    kilometer 200
  end
end
