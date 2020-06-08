class Api::V1::FoodieController < ApplicationController
  def show

    travel_info = GoogleService.new.travel_info(params['start'], params['end'])
    travel_object = TravelInfo.new(travel_info)
    
    search_results = WeatherSearch.new
    destination_weather = search_results.weather(params['end'])
    destination_weather_object = DestinationWeather.new(destination_weather)

    conn = Faraday.new(
          url: 'https://developers.zomato.com/api/v2.1/',
          headers: {'user-key' => ENV['ZOMATO_API_KEY']}
          )
    
    response = conn.get('search') do |req|
      req.params['lat'] = travel_object.destination_lat
      req.params['lon'] = travel_object.destination_lng
      req.params['cuisines'] = 55
      req.params['count'] = 1
    end

    json = JSON.parse(response.body, symbolize_names: true)

    restaurant_object = DestinationRestaurant.new(json)
    binding.pry
  end

end