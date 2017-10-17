class Fee < ApplicationRecord

  before_save :cost_calculation

  belongs_to :user
  belongs_to :car

  validates :date, presence: true
  validates :departure, presence: true
  validates :arrival, presence: true
  validates_inclusion_of :type_of_trajet, in: [true, false]
  validates :kilometer, presence: true

  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf"] }
  validates_with AttachmentSizeValidator, attributes: :attachment, less_than: 1.megabytes

  private

  def cost_calculation
    if self.type_of_trajet
      self.cost = (self.kilometer * Car.find(car_id).scale.coefficient) * 2
    else
      self.cost = self.kilometer * Car.find(car_id).scale.coefficient
    end
  end
end
