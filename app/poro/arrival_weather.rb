class ArrivalWeather
  attr_reader :temp,
              :description

  def initialize(weather, travel)
    @temp = arrival_forecast(weather, travel).temp
    @description = arrival_forecast(weather, travel).description
  end

  def arrival_forecast(weather, travel)
    weather.find do |hour_weather|
      hour_weather.time == arrival_hour(travel)
    end
  end
  
  def arrival_hour(travel)
    arrival_time = Time.now + travel.time_sec.seconds
    format_time(arrival_time)
  end
  
  def format_time(dt)
    Time.at(dt).strftime('%l %p')
  end
end