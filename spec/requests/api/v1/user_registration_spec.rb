require 'rails_helper'

RSpec.describe 'User Registration API', :vcr do
  it 'Registers User and returns response with 201 status' do
    user_info = {
      'email': 'email@example.com',
      'password': 'password',
      'password_confirmation': 'password'
    }
    post '/api/v1/users', params: user_info, as: :json
    expect(response).to be_successful
    expect(response.status).to eq(201)
    
    user = User.last
    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end