class CurrentWeather
  include Convertable

  attr_reader :date,
              :time,
              :current_temp,
              :high,
              :low,
              :feels_like,
              :humidity,
              :sunrise,
              :sunset,
              :uv_index,
              :visibility,
              :type,
              :icon

  def initialize(data)
    @time = format_time(data[:current][:dt], '%I:%M %p')
    @date = format_date(data[:current][:dt], '%B %d')
    @current_temp = kelvin_to_fahrenheit(data[:current][:temp])
    @high = kelvin_to_fahrenheit(data[:daily].first[:temp][:max])
    @low = kelvin_to_fahrenheit(data[:daily].first[:temp][:min])
    @feels_like = kelvin_to_fahrenheit(data[:current][:feels_like])
    @humidity = data[:current][:humidity]
    @sunrise = format_time(data[:current][:sunrise], '%I:%M %p')
    @sunset = format_time(data[:current][:sunset], '%I:%M %p')
    @uv_index = data[:current][:uvi]
    @visibility = meters_to_miles(data[:current][:visibility])
    @type = data[:current][:weather].first[:main]
    @icon = data[:current][:weather].first[:icon]
  end
end
