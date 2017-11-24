require 'rails_helper'

RSpec.describe Car, type: :model do

    it 'should create an Car' do
      user = create(:user)
      scale = create(:scale)
      create(:car, user: user, scale: scale)
      expect(Car.count).to eq(1)
    end

end
