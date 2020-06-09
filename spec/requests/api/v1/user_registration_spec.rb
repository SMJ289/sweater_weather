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

    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it 'cannot register user when email is already taken' do
    User.create(
      email: 'email@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    user_info = {
      'email': 'email@example.com',
      'password': 'password',
      'password_confirmation': 'password'
    }
    post '/api/v1/users', params: user_info, as: :json

    expect(response.status).to eq(400)
    
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:message]).to eq("Email has already been taken")
  end

  it 'cannot register user when info is missing' do
    user_info = {
      'email': nil,
      'password': nil,
      'password_confirmation': nil
    }
    post '/api/v1/users', params: user_info, as: :json

    expect(response.status).to eq(400)
    
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:message]).to eq("Email can't be blank, Password can't be blank, and Password can't be blank")
  end

  it 'cannot register user when passwords do not match' do
    user_info = {
      'email': 'example@example.com',
      'password': 'cat',
      'password_confirmation': 'dog'
    }
    post '/api/v1/users', params: user_info, as: :json

    expect(response.status).to eq(400)
    
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:message]).to eq("Password confirmation doesn't match Password")
  end
end