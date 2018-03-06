require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #home" do
    context "user signed" do
      log_in_user
      it "redirect_to user_path" do
        get :home
        expect(response).to redirect_to @user
      end
    end

    context "user not signed" do
      it "redirect_to root_path" do
        get :home
        expect(response.status).to render_template :home
      end
    end
  end

  describe "GET :show" do

    log_in_user

    it "assign the requested user to @user" do
      get :show, params: { id: @user }
      expect(assigns(:user)).to eq(@user)
    end

    it "assign the requested car to @car" do
      @scale = create(:scale)
      @car = create(:car, user_id: @user.id, scale_id: @scale.id)
      @car_user = @user.cars
      get :show, params: { id: @user }
      expect(assigns(:cars)).to eq(@car_user)
    end

    it "assign the requested fees to @fee" do
      @scale = create(:scale)
      @car = create(:car, user_id: @user.id, scale_id: @scale.id)
      @fee = create(:fee, user_id: @user.id, car: @car.id)
      @user_fee = @user.fees
      get :show, params: { id: @user }
      expect(assigns(:fees)).to eq(@user_fee)
    end
  end
end
