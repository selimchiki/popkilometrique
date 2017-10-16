class CarsController < ApplicationController
  def new
    @car = current_user.cars.new
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  private

  def car_params
    params.require(:cars).permit(:model, :scale_id, :user_id)
  end
end