require 'rails_helper'

RSpec.describe CarsController, type: :controller do

  describe "GET #new" do

    log_in_user

    it "assigns a new Car to @car" do
      user = session[:user_id]
      car = build(:car, user_id: user)
      get :new
      expect(assigns(:car)).to be_a_new(Car)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    log_in_user

    context "with valid attributes" do
      it "saves the new car in the database" do
        user_id = session[:user_id]
        scale = create(:scale)
        post :create, :params => { cars: attributes_for(:car, scale_id: scale, user_id: user_id) }
        expect(Car.count).to eq(1)
      end
      it "redirects to the user page"  do
        user_id = session[:user_id]
        scale = create(:scale)
        post :create, :params => { cars: attributes_for(:car, scale_id: scale, user_id: user_id) }
        expect(response).to redirect_to @user
      end
    end

    context "with invalid attributes" do
      it "does not save the new car in the database" do
        user_id = session[:user_id]
        post :create, :params => { cars: attributes_for(:car, user_id: user_id) }
        expect(Car.count).to eq(0)
      end
      it "re-renders the :new template" do
        user_id = session[:user_id]
        post :create, :params => { cars: attributes_for(:car, user_id: user_id) }
        expect(response).to render_template :new
      end
    end
  end

  describe "Update" do

    log_in_user

    before(:each) do
      scale = create(:scale)
      @car = create(:car)
    end

    context "with valid value" do
      it "saves the new value in the database" do
        patch :update, params: { id: @car, cars: attributes_for(:car, model: "Tesla")}
        @car.reload
        expect(@car.model).to eq("Tesla")
      end

      it "redirect to user page" do
        patch :update, params: { id: @car, cars: attributes_for(:car, model: "Tesla")}
        expect(response).to redirect_to @user
      end
    end

    context "with invalid value" do
      it "don't save the new value in the database" do
        patch :update, params: { id: @car, cars: attributes_for(:car, model: nil)}
        expect(@car.model).to eq("C4")
      end

      it "render 'edit' page" do
        patch :update, params: { id: @car, cars: attributes_for(:car, model: nil)}
        expect(response).to render_template :edit
      end
    end
  end

  describe "Destroy" do

    log_in_user

    before(:each) do
      scale = create(:scale)
      @car = create(:car, scale_id: scale.id)
    end

    it "delete the car" do
      delete :destroy, params: {id: @car}
      expect(Car.count).to eq(0)
    end
  end
end
