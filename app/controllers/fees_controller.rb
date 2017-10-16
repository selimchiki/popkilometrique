class FeesController < ApplicationController
  def new
    @fee = current_user.fees.new
  end

  def create
    @trajet = current_user.trajets.new(params_trajet)
    if @trajet.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  private

  def params_trajet
    params.require(:trajets).permit(:date, :depart, :arrivée, :kilometre, :cout, :car_id, :type_of_trajet)
  end
end
