require 'rails_helper'

RSpec.describe 'Background image API' do
  it 'returns an image url' do
    location = "madison, wi"

    get "/api/v1/backgrounds?location=#{location}"
    expect(response).to be_successful

    background_json = JSON.parse(response.body, symbolize_names: true)

    expect(forecast_json[:data][:attributes][:url]).to be_present
  end

end