require 'rails_helper'

RSpec.describe 'Forcast API' do
  it 'returns current weather data by city and state' do
    starting_location = "denver, co"
    ending_location = "pueblo, co"

    get "/api/v1/foodie?start=#{starting_location}&end=#{ending_location}&search=italian"
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data][:attributes][:resturaunt]).to be_present
    expect(json[:data][:attributes][:end_location]).to be_present
  end
end