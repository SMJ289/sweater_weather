class WeatherSearch
  def weather(location)
    json = OpenWeatherService.new.weather(location)
  end
end