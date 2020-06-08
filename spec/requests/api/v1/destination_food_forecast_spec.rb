require 'rails_helper'

RSpec.describe 'Forcast API' do
  it 'returns current weather data by city and state' do
    starting_location = "denver, co"
    ending_location = "pueblo, co"

    get "/api/v1/foodie?start=#{starting_location}&end=#{ending_location}&search=italian"
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data][:attributes][:travel]).to be_present
    expect(json[:data][:attributes][:travel][:destination_address]).to eq("Pueblo, CO, USA")
    expect(json[:data][:attributes][:forecast]).to be_present
    expect(json[:data][:attributes][:forecast][:current_temp]).to be_a Integer
    expect(json[:data][:attributes][:restaurant]).to be_present
    expect(json[:data][:attributes][:restaurant][:name]).to eq("Angelo's Pizza Parlor")
  end
end