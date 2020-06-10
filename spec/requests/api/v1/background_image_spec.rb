require 'rails_helper'

RSpec.describe 'Background image API', :vcr do
  it 'returns an image url' do
    location = "madison, wi"

    get "/api/v1/backgrounds?location=#{location}"
    expect(response).to be_successful

    background_json = JSON.parse(response.body, symbolize_names: true)

    expect(background_json[:data][:attributes][:url]).to be_present
  end

  it 'returns error if param is missing' do
    location = ""

    get "/api/v1/backgrounds?location=#{location}"
    expect(response.status).to eq(400)

    forecast_response = JSON.parse(response.body, symbolize_names: true)
    expect(forecast_response[:message]).to eq('Location not given.')
  end
end