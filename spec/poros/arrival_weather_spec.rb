require 'rails_helper'

RSpec.describe ArrivalWeather do
  describe 'instance methods' do
    it '#initialize()', :vcr do
      search_results = WeatherSearch.new
      weather = search_results.weather('pueblo, co')
      travel_search = TravelSearch.new
      travel = travel_search.travel_data('denver, co', 'pueblo, co')
      arrival_weather = ArrivalWeather.new(weather, travel)

      expect(arrival_weather.temp).to be_present
      expect(arrival_weather.description).to be_present
    end
  end
end