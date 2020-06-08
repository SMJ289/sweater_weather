class Api::V1::FoodieController < ApplicationController
  def show
    travel_search = TravelSearch.new
    travel = travel_search.travel_data(params['start'], params['end'])
    
    weather_search = WeatherSearch.new
    weather = weather_search.weather(params['end'])
    dest_weather = DestinationWeather.new(weather)

    restaurant_search = RestaurantSearch.new
    restaurant = restaurant_search.restaurant(params['search'],travel.destination_lat, travel.destination_lng)

    destination_info = DestinationInfo.new(travel, dest_weather, restaurant)

    render json: FoodieSerializer.new(destination_info)
  end

end