require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Associations' do
    it { should belong_to(:owner) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:owner_id) }
  end

  it 'has a valid factory' do
    user = FactoryGirl.create(:user)
    expect(FactoryGirl.create(:article, owner_id: user.id)).to be_valid
  end
end
