require 'rails_helper'

RSpec.describe FeesController, type: :controller do

  describe "GET #new" do

    log_in_user

    it "assigns a new fee to @fee" do
      user = session[:user_id]
      scale = create(:scale)
      car = create(:car)
      fee = build(:fee, user_id: user, car: car)
      get :new
      expect(assigns(:fee)).to be_a_new(Fee)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    log_in_user

    before(:each) do
      scale = create(:scale)
      @car = create(:car)
    end

    context "with valid attributes" do
      it "saves the new fee in the database" do
        post :create, params: { fees: attributes_for(:fee, car: @car )}
        expect(Fee.count).to eq(1)
      end

      it "redirects to the user page " do
        post :create, params: { fees: attributes_for(:fee, car: @car )}
        expect(response).to redirect_to @user
      end
    end

    context "with invalid attributes" do
      it "dont save the new fee in the database" do
        post :create, params: { fees: attributes_for(:fee, departure: nil, car: @car )}
        expect(Fee.count).to eq(0)
      end

      it "render the :new template" do
        post :create, params: { fees: attributes_for(:fee, departure: nil, car: @car )}
        expect(response).to render_template :new
      end
    end
  end

  describe "show" do

    log_in_user

    before(:each) do
      scale = create(:scale)
      car = create(:car, scale_id: scale.id)
      @fee = create(:fee, user_id: @user.id, car: car.id)
    end

    it "assigns the requested contact to @contact" do
      get :show, params: {id: @fee.id }
      expect(assigns(:fee)).to eq(@fee)
    end

    it "renders the #show view" do
      get :show, params: { id: @fee.id }
      expect(response).to render_template :show
    end

  end

  describe "responds to" do

    log_in_user

    before(:each) do
      scale = create(:scale)
      car = create(:car, scale_id: scale.id)
      @fee = create(:fee, user_id: @user.id, car: car.id)
    end

    it "responds to html by default in show" do
      get :show, params: { id: @fee.id }
      expect(response.content_type).to eq "text/html"
    end

    it "responds to pdf in show" do
      get :show, params: { id: @fee.id }, format: :pdf
      expect(response.content_type).to eq "application/pdf"
    end

  end
end
