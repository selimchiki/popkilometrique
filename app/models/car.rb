class Car < ApplicationRecord
  belongs_to :scale
  belongs_to :user
  has_many :fees

end
