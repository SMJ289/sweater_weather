class DailyWeather
  include Convertable

  attr_reader :date,
              :high,
              :low,
              :type,
              :icon,
              :rain

  def initialize(data)
    @date = format_date(data[:dt], '%A, %b %d')
    @high = kelvin_to_fahrenheit(data[:temp][:max])
    @low = kelvin_to_fahrenheit(data[:temp][:min])
    @type = data[:weather].first[:main]
    @icon = data[:weather].first[:icon]
    @rain = data[:rain]
  end
end
