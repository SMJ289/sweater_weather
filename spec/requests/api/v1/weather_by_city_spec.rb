require 'rails_helper'

RSpec.describe 'Forcast API' do
  it 'returns current weather data by city and state' do
    location = "seatle, wa"

    get "/api/v1/forecast?location=#{location}"
    expect(response).to be_successful

    forecast_response = JSON.parse(response.body, symbolize_names: true)

    expect(forecast_response[:data][:attributes][:current][:time]).to be_present
    expect(forecast_response[:data][:attributes][:current][:date]).to be_present
    expect(forecast_response[:data][:attributes][:current][:current_temp]).to be_present
    expect(forecast_response[:data][:attributes][:current][:high]).to be_present
    expect(forecast_response[:data][:attributes][:current][:low]).to be_present
    expect(forecast_response[:data][:attributes][:current][:feels_like]).to be_present
    expect(forecast_response[:data][:attributes][:current][:humidity]).to be_present
    expect(forecast_response[:data][:attributes][:current][:sunrise]).to be_present
    expect(forecast_response[:data][:attributes][:current][:sunset]).to be_present
    expect(forecast_response[:data][:attributes][:current][:uv_index]).to be_present
    expect(forecast_response[:data][:attributes][:current][:visibility]).to be_present
    expect(forecast_response[:data][:attributes][:current][:type]).to be_present
    
    expect(forecast_response[:data][:attributes][:daily].first[:date]).to be_present
    expect(forecast_response[:data][:attributes][:daily].first[:high]).to be_present
    expect(forecast_response[:data][:attributes][:daily].first[:low]).to be_present
    expect(forecast_response[:data][:attributes][:daily].first[:type]).to be_present
    expect(forecast_response[:data][:attributes][:daily].first[:icon]).to be_present
    expect(forecast_response[:data][:attributes][:daily].first[:rain]).to be_present
    
    expect(forecast_response[:data][:attributes][:hourly].first[:time]).to be_present
    expect(forecast_response[:data][:attributes][:hourly].first[:temp]).to be_present
    expect(forecast_response[:data][:attributes][:hourly].first[:icon]).to be_present
  end
end