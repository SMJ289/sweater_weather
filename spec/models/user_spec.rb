require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
  end

  describe 'instance methods' do
    it '#generate_api_key' do
      user = User.new(email: 'example@example.com', password: 'password')
      expect(user.generate_api_key.length).to eq(24)
    end
  end

  describe 'class methods' do
    it '.set_api_key' do
      user = User.new(email: 'example@example.com', password: 'password')
      
      expect(user.set_api_key.length).to eq(24)
    end
  end
end
