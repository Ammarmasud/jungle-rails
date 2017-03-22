require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create a new user' do
      user = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail1@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      expect(user.id).to be_present
    end

    it 'should give an error, passwords don\'t match' do
      user = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail2@email.com',
        password: 'passwordOne',
        password_confirmation: 'passwordTwo',
      })
      expect(user.id).to be_nil
    end

    it 'should give an error, email already exists (same case)' do
      user1 = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail3@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      user2 = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail3@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      # puts user2.errors.full_messages
      expect(user2.id).to be_nil
    end

    it 'should give an error, email already exists (different case)' do
      user1 = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail4@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      user2 = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'NEWemail4@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      # puts user2.errors.full_messages
      expect(user2.id).to be_nil
    end

    it 'should give an error, email missing' do
      user = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        password: 'password',
        password_confirmation: 'password',
      })
      expect(user.id).to be_nil
    end

    it 'should give an error, first name missing' do
      user = User.create({
        last_name: 'newMasud',
        email: 'NEWemail5@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      expect(user.id).to be_nil
    end

    it 'should give an error, last name missing' do
      user = User.create({
        first_name: 'newAmmar',
        email: 'NEWemail6@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      expect(user.id).to be_nil
    end

    it 'should give an error, password too short' do
      user = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'NEWemail7@email.com',
        password: 'p',
        password_confirmation: 'p',
      })
      expect(user.id).to be_nil
    end

  end



  describe '.authenticate_with_credentials' do
    it 'should authenticate the existing user' do
      user = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail8@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      expect(User.authenticate_with_credentials('newemail8@email.com', 'password')).to be_truthy
    end

    it 'should give an error, wrong password' do
      user = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail9@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      expect(User.authenticate_with_credentials('newemail9@email.com', 'not_password')).to be_falsey
    end

    it 'should give an error, user does not exist' do
      expect(User.authenticate_with_credentials('NEWemail1000@email.com', 'password')).to be_falsey
    end


    it 'should login for case insensitive email' do
      user = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail10@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      expect(User.authenticate_with_credentials('NEWemail10@email.com', 'password')).to be_truthy
    end

    it 'should give an error for spaces around email' do
      user = User.create({
        first_name: 'newAmmar',
        last_name: 'newMasud',
        email: 'newemail11@email.com',
        password: 'password',
        password_confirmation: 'password',
      })
      expect(User.authenticate_with_credentials('  newemail11@email.com', 'password')).to be_falsey

    end
  end
end
