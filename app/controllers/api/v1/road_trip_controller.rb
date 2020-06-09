class Api::V1::RoadTripController < ApplicationController
  def show
    if User.exists?(api_key: params['api_key'])
      search_results = WeatherSearch.new
      weather = search_results.weather(params['destination'])
      
      travel_search = TravelSearch.new
      travel = travel_search.travel_data(params['origin'], params['destination'])

      hourly_weather = weather[:hourly].map do |hour|
                        HourlyWeather.new(hour)
                      end 
      # arrival_weather = ArrivalWeather.new(hourly_weather, travel.travel_time_sec)
      trip_info = RoadTrip.new(hourly_weather, travel)
      render json: RoadTripSerializer.new(trip_info)

    end
  end
end
