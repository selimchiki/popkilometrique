require 'rails_helper'

RSpec.describe Scale, type: :model do

  it 'should create an Scale' do
    create(:scale)
    expect(Scale.count).to eq(1)
  end



end
