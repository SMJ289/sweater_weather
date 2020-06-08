class Api::V1::FoodieController < ApplicationController
  def show

    travel_info = GoogleService.new.travel_info(params['start'], params['end'])
    travel_object = TravelInfo.new(travel_info)
    
    search_results = WeatherSearch.new
    destination_weather = search_results.weather(params['end'])
    destination_weather_object = DestinationWeather.new(destination_weather)
    binding.pry
  end

end