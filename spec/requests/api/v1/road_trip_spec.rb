require 'rails_helper'

RSpec.describe 'Road Trip API', :vcr do
  it 'returns roadtrip data if API key is valid' do
    user = User.create(email: 'email@example.com', password: 'password', password_confirmation: 'password')
    body = {
      'origin': 'Denver, CO',
      'destination': 'Pueblo, CO',
      'api_key': user.api_key
    }

    post '/api/v1/road_trip', params: body, as: :json
    
    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:origin]).to be_present
    expect(json[:data][:attributes][:destination]).to be_present
    expect(json[:data][:attributes][:travel_time]).to be_present
    expect(json[:data][:attributes][:arrival_temp]).to be_present
    expect(json[:data][:attributes][:arrival_weather_type]).to be_present
  end

  it 'returns error if API key is invalid' do
    user = User.create(email: 'email@example.com', password: 'password', password_confirmation: 'password')
    body = {
      'origin': 'Denver, CO',
      'destination': 'Pueblo, CO',
      'api_key': 'alskjdlaskjdalksjd'
    }

    post '/api/v1/road_trip', params: body, as: :json

    expect(response.status).to eq(401)
  end

  it 'returns error if no API key is provided' do
    user = User.create(email: 'email@example.com', password: 'password', password_confirmation: 'password')
    body = {
      'origin': 'Denver, CO',
      'destination': 'Pueblo, CO',
      'api_key': nil
    }

    post '/api/v1/road_trip', params: body, as: :json

    expect(response.status).to eq(401)
  end

end