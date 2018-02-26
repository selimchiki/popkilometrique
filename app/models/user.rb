class User < ApplicationRecord
  has_secure_password

  has_many :cars
  has_many :fees

end
