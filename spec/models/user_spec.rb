require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation test' do
    context 'If the username is empty' do
      it 'Can\'t register without username' do
        user = User.new(username: '', email: 'user@gmail.com', password: 'hellouser')
        expect(user).not_to be_valid
      end
    end
    context 'If the email is empty' do
      it 'Can\'t register without email' do
        user = User.new(username: 'user', email: '', password: 'hellouser')
        expect(user).not_to be_valid
      end
    end
    context 'If the password is empty' do
      it 'Can\'t register without password' do
        user = User.new(username: 'user', email: 'user@gmail.com', password: '')
        expect(user).not_to be_valid
      end
    end
    context 'If all fields are provided' do
      it 'New user is registered' do
        user = User.new(username: 'user', email: 'user@gmail.com', password: 'hellouser')
        expect(user).to be_valid
      end
    end
  end
end
