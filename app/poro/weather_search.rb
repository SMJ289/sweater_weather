class WeatherSearch
  def weather(location)
    OpenWeatherService.new.weather(location)
  end
end
