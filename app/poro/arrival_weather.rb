class ArrivalWeather
  attr_reader :temp,
              :description

  def initialize(weather, travel)
    weather = hourly_weather(weather)
    @temp = arrival_forecast(weather, travel).temp
    @description = arrival_forecast(weather, travel).description
  end

  def arrival_forecast(weather, travel)
    weather.find do |hour_weather|
      hour_weather.time == arrival_hour(travel)
    end
  end

  def arrival_hour(travel)
    arrival_time = Time.current + travel.time_sec.seconds
    format_time(arrival_time)
  end

  def hourly_weather(weather)
    weather[:hourly].map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def format_time(datetime)
    Time.zone.at(datetime).strftime('%l %p')
  end
end
