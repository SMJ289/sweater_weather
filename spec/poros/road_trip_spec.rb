require 'rails_helper'

RSpec.describe RoadTrip do
  describe 'instance methods' do
    it '#initialize()', :vcr do
      search_results = WeatherSearch.new
      weather = search_results.weather('pueblo, co')
      travel_search = TravelSearch.new
      travel = travel_search.travel_data('denver, co', 'pueblo, co')
      road_trip = RoadTrip.new(weather, travel)
      
      expect(road_trip.origin).to eq("Denver, CO, USA")
      expect(road_trip.travel_time).to be_present
      expect(road_trip.arrival_temp).to be_present
      expect(road_trip.arrival_weather_type).to be_present
      expect(road_trip.id).to eq(1)
    end
  end
end