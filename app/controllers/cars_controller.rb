class CarsController < ApplicationController

  before_action :car_id, only: [:edit, :update, :destroy]

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
  end

  def update
    if @car.update(car_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def destroy
    @car.destroy
    redirect_to user_path(current_user)
  end

  private

  def car_id
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:cars).permit(:model, :scale_id, :user_id)
  end
end