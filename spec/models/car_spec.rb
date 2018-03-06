require 'rails_helper'

RSpec.describe Car, type: :model do

    it 'should create an Car' do
      user = create(:user)
      scale = create(:scale)
      create(:car, model: "C4", user: user, scale: scale)
      expect(Car.count).to eq(1)
    end

    it 'should not create an Car for empty model' do
      car = build(:car_not_model)
      car.validate
      car.save
      expect(Car.count).to eq(0)
    end

    it 'should not create an Car for empty scale' do
      car = build(:car_not_scale)
      car.validate
      car.save
      expect(Car.count).to eq(0)
    end

end
