require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should be able to create a user' do
      user = User.create first_name: 'Nima', last_name: 'Boscarino', email: 'neezy@gmail.com', password: 'neezy!', password_confirmation: 'neezy!'
      expect(user).to be_valid
    end

    it 'should not be able to create a first nameless user' do
      user = User.create last_name: 'Boscarino', email: 'neezy@gmail.com', password: 'neezy!', password_confirmation: 'neezy!'
      expect(user).to_not be_valid
    end

    it 'should not be able to create a last nameless user' do
      user = User.create first_name: 'Nima', email: 'neezy@gmail.com', password: 'neezy!', password_confirmation: 'neezy!'
      expect(user).to_not be_valid
    end

    it 'should not be able to create a email-less user' do
      user = User.create first_name: 'Nima', last_name: 'Boscarino', password: 'neezy!', password_confirmation: 'neezy!'
      expect(user).to_not be_valid
    end

    it 'should not be able to create a user with non-unique email' do
      user1 = User.create first_name: 'Travis', last_name: 'Borsa', email: 'neezy@gmail.com', password: 'therealneezy', password_confirmation: 'therealneezy'
      user2 = User.create first_name: 'Nima', last_name: 'Boscarino', email: 'neezy@gmail.com', password: 'neezy!', password_confirmation: 'neezy!'
      expect(user2).to_not be_valid
    end

    it 'should not be able to create a passwordless user' do
      user = User.create first_name: 'Nima', last_name: 'Boscarino', email: 'neezy@gmail.com', password_confirmation: 'neezy!'
      expect(user).to_not be_valid
    end

    it 'should not be able to create a password_confirmation-less user' do
      user = User.create first_name: 'Nima', last_name: 'Boscarino', email: 'neezy@gmail.com', password: 'neezy!'
      expect(user).to_not be_valid
    end

    it 'should not be able to create a user with a password less then 3 characters' do
      user = User.create first_name: 'Nima', last_name: 'Boscarino', email: 'neezy@gmail.com', password: 'n', password_confirmation: 'n'
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should be able to authenticate valid credentials' do
      user = User.create first_name: 'Nick', last_name: 'Jenvey', email: 'nj@test.com', password: 'nick', password_confirmation: 'nick'
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to_not be_valid
    end
  end
end