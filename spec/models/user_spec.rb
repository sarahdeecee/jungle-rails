require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new(first_name: "First", last_name: "Last", email: "1234@test.com", password_digest: "123")
    end
    
  end
end