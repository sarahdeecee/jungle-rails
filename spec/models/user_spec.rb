require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new(first_name: "First", last_name: "Last", email: "1234@test.com", password_digest: "123")
    end

    #test when password & confirmation match
    #test when password & confirmation don't match
    #password doesn't exist
    #password confirmation doesn't exist
    it 'creates a user when password and password_confirmation match' do
      expect(@user).to be_valid
    end
    #password minimum length
    #

  end
end