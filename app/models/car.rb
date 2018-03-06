class Car < ApplicationRecord
  belongs_to :scale
  belongs_to :user
  has_many :fees

  validates :model, presence: true

  scope :activated, -> {where(active: true)}

end
