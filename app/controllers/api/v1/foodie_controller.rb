class Api::V1::FoodieController < ApplicationController
  def show

    travel_info = GoogleService.new.travel_info(params['start'], params['end'])
    travel = TravelInfo.new(travel_info)
    
    search_results = WeatherSearch.new
    destination_weather = search_results.weather(params['end'])
    weather = DestinationWeather.new(destination_weather)

    conn = Faraday.new(
          url: 'https://developers.zomato.com/api/v2.1/',
          headers: {'user-key' => ENV['ZOMATO_API_KEY']}
          )

    params['search'] = 55 if params['search'] = 'italian'

    food_response = conn.get('search') do |req|
      req.params['lat'] = travel.destination_lat
      req.params['lon'] = travel.destination_lng
      req.params['cuisines'] = params['search']
      req.params['count'] = 1
    end

    json = JSON.parse(food_response.body, symbolize_names: true)

    restaurant = DestinationRestaurant.new(json)


    destination_info = DestinationInfo.new(travel, weather, restaurant)

    render json: FoodieSerializer.new(destination_info)
  end

end