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

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(params.require(:car).permit(:model, :scale_id, :user_id))
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def desactivation
    @car = Car.find(params[:id])
    @car.update(active: false)
    redirect_to user_path(current_user)
  end

  private

  def car_params
    params.require(:cars).permit(:model, :scale_id, :user_id)
  end
end