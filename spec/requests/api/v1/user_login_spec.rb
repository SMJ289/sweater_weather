require 'rails_helper'

RSpec.describe 'User Login API', :vcr do
  it 'User can login with valid credentials' do
    user = User.create(email: 'email@example.com', password: 'password', password_confirmation: 'password')
    
    user_info = {
      'email': 'email@example.com',
      'password': 'password'
    }
    post '/api/v1/sessions', params: user_info, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it 'User cannot login with invalid credentials' do
    user = User.create(email: 'email@example.com', password: 'password', password_confirmation: 'password')
    
    user_info = {
      'email': 'email@example.com',
      'password': '123'
    }
    post '/api/v1/sessions', params: user_info, as: :json

    expect(response.status).to eq(400)
    
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:message]).to eq('Invalid credentials.')
  end
end