class HourlyWeather
  attr_reader :time,
              :temp,
              :icon,
              :description

  def initialize(data)
    @time = format_time(data[:dt])
    @temp = kelvin_to_fahrenheit(data[:temp])
    @icon = data[:weather].first[:icon]
    @description = data[:weather].first[:description]
  end

  def format_time(dt)
    Time.at(dt).strftime('%l %p')
  end

  def kelvin_to_fahrenheit(temp)
    (temp * 9/5 - 459.67).round
  end
end