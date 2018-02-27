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
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "GET :show" do

  end
end
