class SessionsController < ApplicationController

  before_action :authenticate_user!, only: :show

  def home
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @cars = @user.cars.activated
    @fees = @user.fees
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
