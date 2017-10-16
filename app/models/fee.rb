class Fee < ApplicationRecord

  before_save :cost_calculation

  belongs_to :user
  belongs_to :car

  private

  def cost_calculation
    if self.type_of_trajet == 0
      self.cout = kilometer * Car.find(car_id).fees.coefficient
    else
      self.cout = (kilometer * Car.find(car_id).fees.coefficient) * 2
    end
  end
end
