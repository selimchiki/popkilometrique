FactoryBot.define do

  factory :user do
    email "johndoe@yahoo.fr"
    password "azerty"
    password_confirmation "azerty"
  end

  factory :user_not_same_password, class: AdminUser do
    email "johntheripper@yahoo.fr"
    password "azerty"
    password_confirmation "azert"
  end

end
