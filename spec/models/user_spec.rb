require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'Validations' do
    context 'With valid params' do
      it 'is valid with name, last_name, email and password present' do
        expect(user).to be_valid
      end

      it 'is invalid without a name' do
        user.name = nil
        expect(user).to_not be_valid
      end

      it 'is invalid without a last name' do
        user.last_name = nil
        expect(user).to_not be_valid
      end

      it 'is invalid without a email' do
        user.email = nil
        expect(user).to_not be_valid
      end

      it 'is invalid characters email' do
        user.name = "@#d2s@gmail.com"
        expect(user).to_not be_valid
      end

      it 'is invalid without a password' do
        user.password = nil
        expect(user).to_not be_valid
      end

      it 'is invalid if it has less than 6 characters.' do
        user.password = "123"
        expect(user).to_not be_valid
      end
    end
  end
end
