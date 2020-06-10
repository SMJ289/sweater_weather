class DailyWeather
  attr_reader :date,
              :high,
              :low,
              :type,
              :icon,
              :rain

  def initialize(data)
    @date = format_date(data[:dt])
    @high = kelvin_to_fahrenheit(data[:temp][:max])
    @low = kelvin_to_fahrenheit(data[:temp][:min])
    @type = data[:weather].first[:main]
    @icon = data[:weather].first[:icon]
    @rain = data[:rain]
  end

  def format_date(datetime)
    Time.zone.at(datetime).strftime('%A, %b %d')
  end

  def kelvin_to_fahrenheit(temp)
    (temp * 9 / 5 - 459.67).round
  end
end
