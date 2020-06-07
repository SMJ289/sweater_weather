require 'rails_helper'

RSpec.describe 'Forcast API' do
  it 'returns weather data by city and state' do
    location = "denver, co"

    get "/api/v1/forecast?location=#{location}"
  end
end