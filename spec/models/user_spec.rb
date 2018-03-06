require 'rails_helper'

RSpec.describe User, type: :model do

  it "should create an user" do
    user = create(:user)
    expect(user.valid?).to be true
    expect(User.count).to eq(1)
  end

  it "should have not the same password" do
    user_not = build(:user_not_same_password)
    user_not.validate
    user_not.save
    expect(user_not.valid?).to be false
    expect(User.count).to eq(0)
  end

end
