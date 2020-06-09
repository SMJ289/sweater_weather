class Api::V1::RoadTripController < ApplicationController
  def show
    if User.exists?(api_key: params['api_key'])
      search_results = WeatherSearch.new
      weather = search_results.weather(params['destination'])
      travel_search = TravelSearch.new
      travel = travel_search.travel_data(params['origin'], params['destination'])
      trip_info = RoadTrip.new(weather, travel)

      render json: RoadTripSerializer.new(trip_info)
    else
      render json: {}, status: 401
    end
  end
end
