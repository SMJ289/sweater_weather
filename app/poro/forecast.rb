class Forecast
  attr_reader :current,
              :daily,
              :hourly,
              :id

  def initialize(data)
    @current = CurrentWeather.new(data)
    @daily = daily_weather(data)
    @hourly = hourly_weather(data)
    @id = 1
  end

  private

  def daily_weather(data)
    data[:daily].map do |day|
      DailyWeather.new(day)
    end
  end

  def hourly_weather(data)
    data[:hourly].map do |hour|
      HourlyWeather.new(hour)
    end
  end
end