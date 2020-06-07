require 'rails_helper'

RSpec.describe 'Forcast API' do
  it 'returns weather data by city and state' do
    location = "denver, co"

    get "/api/v1/forecast?location=#{location}"
    expect(response).to be_successful

    forecast_response = JSON.parse(response.body, symbolize_names: true)
    expect(forecast_response[:data]).to be_present
  end
end