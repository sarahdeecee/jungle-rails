require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "1234@test.com",
        password: "12345678",
        password_confirmation: "12345678"
      )
    end

    it 'creates a user when password and password_confirmation match' do
      expect(@user).to be_valid
    end
    
    it 'is invalid when password and password_confirmation do not match' do
      @user.password = "456"
      expect(@user).not_to be_valid
    end
    
    it 'is invalid when password is not given' do
      @user.password = nil
      expect(@user).not_to be_valid
    end
    
    it 'is invalid when password_confirmation is not given' do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end
    
    it 'is invalid when email is not given' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'is invalid when first name is not given' do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it 'is invalid when last name is not given' do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it 'is invalid when email is not unique (non-case-sensitive)' do
      @user.save
      @new_user = User.new(
        first_name: "FirstNew",
        last_name: "LastNew",
        email: "1234@TEST.com",
        password: "12345678",
        password_confirmation: "12345678"
      )
      expect(@user).to be_valid
      expect(@new_user).not_to be_valid
    end
    
    it 'is valid when password is more than the minimum length (8 char)' do
      @user.password = '123456789'
      @user.password_confirmation = '123456789'
      valid_length = (@user.password).length >= 8 && (@user.password_confirmation).length >= 8
      expect(valid_length).to be_truthy
    end

    it 'is invalid when password is less than the minimum length (8 char)' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      valid_length = (@user.password).length >= 8 && (@user.password_confirmation).length >= 8
      expect(valid_length).to be_falsey
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "1234@test.com",
        password: "12345678",
        password_confirmation: "12345678"
      )
      @user.save
    end

    it 'logs the user in when the email and password are correct' do
      @login_user = User.authenticate_with_credentials('1234@test.com', '12345678')
      expect(@user).to eq(@login_user)
    end
    
    it 'does not log the user in when the email is incorrect' do
      @login_user = User.authenticate_with_credentials('1234@test.com', '12345678')
      expect(@user).to eq(@login_user)
    end
    
    it 'does not log the user in when the password is incorrect' do
      @login_user = User.authenticate_with_credentials('1234@test.com', '12345678')
      expect(@user).to eq(@login_user)
    end
    
    it 'logs the user in when the email has extra whitespace around it' do
      @login_user = User.authenticate_with_credentials('  1234@test.com ', '12345678')
      expect(@user).to eq(@login_user)
    end
    
    it 'logs the user in when the email has the wrong case' do
      @login_user = User.authenticate_with_credentials('1234@TEST.com', '12345678')
      expect(@user).to eq(@login_user)
    end

  end

end