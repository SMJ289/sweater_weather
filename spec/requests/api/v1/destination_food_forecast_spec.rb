require 'rails_helper'

RSpec.describe 'Forcast API' do
  it 'returns current weather data by city and state' do
    starting_location = "denver, co"
    ending_location = "pueblo, co"

    get "/api/v1/foodie?start=#{starting_location}&end=#{ending_location}&search=italian"
    expect(response).to be_successful
  end
end