FactoryBot.define do

  factory :admin_user do
    email 'selimchiki@yahoo.fr'
    password 'azerty'
    password_confirmation 'azerty'
  end

  factory :admin_error_password_confirmation, class: AdminUser do
    email 'max@yahoo.fr'
    password 'azerty'
    password_confirmation 'll'
  end

  factory :admin_error_email, class: AdminUser do
    email 'max'
    password 'azerty'
    password_confirmation 'azerty'
  end

end
