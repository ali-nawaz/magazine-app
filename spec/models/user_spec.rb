require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:articles) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  describe '#initials' do
    let(:user) { create(:user, name: 'Jane Doe') }
    let(:user_with_middle_name) { create(:user, name: 'John Doe Richard') }
    let(:user_with_mononym) { create(:user, name: 'Yoona') }
    let(:user_with_no_name) { create(:user, name: '') }

    context 'user has a name Jane Doe' do
      it 'returns JD as the user\'s initials' do
        expect(user.initials).to eq('JD')
      end
    end

    context 'user has a name John Doe Richard' do
      it 'returns JD as the user\'s initials' do
        expect(user_with_middle_name.initials).to eq('JR')
      end
    end

    context 'user has no name' do
      it 'returns first letter of email' do
        expect(user_with_no_name.initials).to eq(user_with_no_name.email[0].upcase)
      end
    end

    context 'user has a single name' do
      it 'return the first letter of the name' do
        expect(user_with_mononym.initials).to eq('Y')
      end
    end
  end

  describe 'name_or_username' do
    let(:user) { create(:user, name: 'Jane Doe') }
    let(:user_with_no_name) { create(:user, name: '') }

    context 'user has a name Jane Doe' do
      it 'returns the user\'s name' do
        expect(user.name_or_username).to eq('Jane Doe')
      end
    end

    context 'user has no name' do
      it 'returns the first part of email before @ sign' do
        username = user_with_no_name.email.split('@').first

        expect(user_with_no_name.name_or_username).to eq(username)
      end
    end
  end
end
