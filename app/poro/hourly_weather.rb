class HourlyWeather
  include Convertable

  attr_reader :time,
              :temp,
              :icon,
              :description

  def initialize(data)
    @time = format_time(data[:dt], '%l %p')
    @temp = kelvin_to_fahrenheit(data[:temp])
    @icon = data[:weather].first[:icon]
    @description = data[:weather].first[:description]
  end
end
