require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    # product name validation example
    it "should have success with all fields present" do
      user = User.create(
        name: 'name',
        password: 'password',
        password_confirmation: 'password',
        email:'test@test.com'
        )
      puts user.errors.full_messages
      expect(user).to be_a User
    end

    it "is not valid without unique email" do
      User.create(
        name: 'name',
        password: 'password',
        password_confirmation: 'password',
        email: 'fsdfasdfasd')
      user = User.create(
        name: 'name',
        password: 'password',
        password_confirmation: 'password',
        email: 'fsdfasdfasd')
      puts user.errors.full_messages
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it "is not valid without email and name" do
      user = User.create(
        password: 'password',
        password_confirmation: 'password'
      )
      puts user.errors.full_messages
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
