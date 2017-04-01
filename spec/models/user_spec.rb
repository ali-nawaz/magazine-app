require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
end
