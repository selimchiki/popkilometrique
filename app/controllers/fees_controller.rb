class FeesController < ApplicationController
  def new
    @fee = current_user.fees.new
  end

  def create
    @fee = current_user.fees.new(params_fees)
    if @fee.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  private

  def params_fees
    params.require(:fees).permit(:date, :departure, :arrival, :kilometer, :cost, :car_id, :type_of_trajet, :attachment)
  end
end
