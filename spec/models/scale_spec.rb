require 'rails_helper'

RSpec.describe Scale, type: :model do

  it 'should create an Scale' do
    create(:scale)
    expect(Scale.count).to eq(1)
  end

  it 'should not create an Scale for not vehicle type' do
    scale = build(:scale_not_vehicle_type)
    scale.validate
    scale.save
    expect(Scale.count).to eq(0)
  end

  it 'should not create an Scale for not fiscal power' do
    scale = build(:scale_not_fiscal_power)
    scale.validate
    scale.save
    expect(Scale.count).to eq(0)
  end

  it 'should not create an Scale for not coefficient' do
    scale = build(:scale_not_coefficient)
    scale.validate
    scale.save
    expect(Scale.count).to eq(0)
  end

  it 'should not create an Scale for not coefficient' do
    scale = build(:scale_not_active)
    scale.validate
    scale.save
    expect(Scale.count).to eq(0)
  end

end
