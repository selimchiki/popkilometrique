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

  it 'should not create a fee for not date' do
    fee = build(:fee_not_date)
    fee.validate
    fee.save
    expect(Fee.count).to eq(0)
  end

  it 'should not create a fee for not departure' do
    fee = build(:fee_not_departure)
    fee.validate
    fee.save
    expect(Fee.count).to eq(0)
  end

  it 'should not create a fee for not arrival' do
    fee = build(:fee_not_arrival)
    fee.validate
    fee.save
    expect(Fee.count).to eq(0)
  end

  it 'should not create a fee for not type of trajet' do
    fee = build(:fee_not_type_of_trajet)
    fee.validate
    fee.save
    expect(Fee.count).to eq(0)
  end

  it 'should not create a fee for not kilometer' do
    fee = build(:fee_not_kilometer)
    fee.validate
    fee.save
    expect(Fee.count).to eq(0)
  end

end
