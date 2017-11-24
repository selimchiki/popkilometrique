require 'rails_helper'

RSpec.describe Fee, type: :model do

  it 'should create a fee' do
    user = create(:user)
    scale = create(:scale)
    car = create(:car, user: user, scale: scale)
    fee = create(:fee, user: user, car: car.id)
    expect(Fee.count).to eq(1)
    expect(fee.cost).to eq(124.0)
  end

end
