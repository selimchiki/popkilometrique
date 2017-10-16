class Car < ApplicationRecord
  belongs_to :scale
  belongs_to :user
  has_many :fees

  scope :activated, -> {where(active: true)}

end
