class Api::V1::FoodieController < ApplicationController
  def show
    travel_search_results = TravelSearch.new
    travel = travel_search_results.travel_data(params['start'], params['end'])
    
    search_results = WeatherSearch.new
    destination_weather = search_results.weather(params['end'])
    weather = DestinationWeather.new(destination_weather)

    restaurant_search_results = RestaurantSearch.new
    restaurant = restaurant_search_results.restaurant(params['search'],travel.destination_lat, travel.destination_lng)

    destination_info = DestinationInfo.new(travel, weather, restaurant)

    render json: FoodieSerializer.new(destination_info)
  end

end