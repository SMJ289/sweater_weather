class DestinationInfo
  attr_reader :travel, 
              :forecast,
              :restaurant,
              :id

  def initialize(travel, weather, restaurant)
    @travel = travel
    @forecast = weather
    @restaurant = restaurant
    @id = 1
  end

  # def travel_info(data)
  #   travel_info = GoogleService.new.travel_info(params['start'], params['end'])
  #   TravelInfo.new(travel_info)
  # end

  # def forecast(data)
  #   search_results = WeatherSearch.new
  #   destination_weather = search_results.weather(params['end'])
  #   DestinationWeather.new(destination_weather)
  # end

  # def restaurant(data)
  #   conn = Faraday.new(
  #     url: 'https://developers.zomato.com/api/v2.1/',
  #     headers: {'user-key' => ENV['ZOMATO_API_KEY']}
  #     )

  #   params['search'] = 55 if params['search'] = 'italian'

  #   response = conn.get('search') do |req|
  #     req.params['lat'] = @travel_info.destination_lat
  #     req.params['lon'] = @travel_info.destination_lng
  #     req.params['cuisines'] = params['search']
  #     req.params['count'] = 1
  #   end

  #   json = JSON.parse(response.body, symbolize_names: true)

  #   restaurant_object = DestinationRestaurant.new(json)
  # end
end