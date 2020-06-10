class OpenWeatherService
  def weather(location)
    coordinates = Coordinates.new

    response = conn.get('data/2.5/onecall') do |req|
      req.params['lat'] = coordinates.lat(location)
      req.params['lon'] = coordinates.lon(location)
      req.params['exclude'] = 'minutely'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://api.openweathermap.org/',
      params: { appid: ENV['WEATHER_API_KEY'] },
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
