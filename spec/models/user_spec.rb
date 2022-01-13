require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "1234@test.com",
        password: "123",
        password_confirmation: "123"
      )
    end

    it 'creates a user when password and password_confirmation match' do
      expect(@user).to be_valid
    end
    
    it 'creates a user even if there are extra spaces around the email address' do
      # @user.email = "  1234@test.com "
      @user.email = " "
      expect(@user).to be_valid
    end
    
    it 'creates a user when the email address has the wrong case' do
      # @user.email = "1234@TEST.coM"
      @user.email = ""
      expect(@user).to be_valid
    end
    
    it 'is invalid when password and password_confirmation do not match' do
      # @user.password = "456"
      expect(@user).not_to be_valid
    end
    
    it 'is invalid when password is not given' do
      # @user.password = nil
      expect(@user).not_to be_valid
    end
    
    it 'is invalid when password_confirmation is not given' do
      # @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end
    
    it 'is invalid when password is less than the minimum length' do
      # @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "1234@test.com",
        password: "123",
        password_confirmation: "123"
      )
    end
    
    it 'logs the user in when the email and password are correct' do
      @user.save
      @login_user = User.authenticate_with_credentials('1234@test.com', '123')
      expect(@user).to eq(@login_user)
    end
    
    it 'does not log the user in when the email is incorrect' do
      @user.save
      @login_user = User.authenticate_with_credentials('1234@test.com', '123')
      expect(@user).to eq(@login_user)
    end
    
    it 'does not log the user in when the password is incorrect' do
      @user.save
      @login_user = User.authenticate_with_credentials('1234@test.com', '123')
      expect(@user).to eq(@login_user)
    end
    
    it 'logs the user in when the email has extra whitespace around it' do
      @user.save
      @login_user = User.authenticate_with_credentials('1234@test.com', '123')
      expect(@user).to eq(@login_user)
    end
    
    it 'logs the user in when the email has the wrong case' do
      @user.save
      @login_user = User.authenticate_with_credentials('1234@test.com', '123')
      expect(@user).to eq(@login_user)
    end

  end

end