require 'rails_helper'

RSpec.describe AdminUser, type: :model do

  it 'should create an admin' do
    create(:admin_user)
    expect(AdminUser.count).to eq(1)
  end

  it 'should don\'t create an admin for password_confirmation' do
    admin = build(:admin_error_password_confirmation)
    admin.validate
    expect(admin.errors.messages).to include(:password_confirmation)
    expect(admin.valid?).to be false
    expect(AdminUser.count).to eq(0)
  end

  it 'should don\'t create an admin for email format' do
    admin = build(:admin_error_email)
    admin.validate
    expect(admin.errors.messages).to include(:email)
    expect(admin.valid?).to be false
    expect(AdminUser.count).to eq(0)
  end

end
