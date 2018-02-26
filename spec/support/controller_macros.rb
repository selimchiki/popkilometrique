module ControllerMacros

  def log_in_user
    before(:each) do
      @user = create(:user)
      if @user && @user.authenticate(@user.password)
        session[:user_id] = @user.id
      end
    end
  end

end