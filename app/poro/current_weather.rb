class CurrentWeather
  attr_reader :current_temp,
              :high,
              :low,
              :feels_like,
              :humidity,
              :sunrise,
              :sunset,
              :uv_index,
              :visibility,
              :type,
              :icon,
              :id

  def initialize(data)
    @current_temp = data[:current][:temp]
    @high = kelvin_to_fahrenheit(data[:daily].first[:temp][:max])
    @low = kelvin_to_fahrenheit(data[:daily].first[:temp][:min])
    @feels_like = kelvin_to_fahrenheit(data[:current][:feels_like])
    @humidity = data[:current][:humidity]
    @sunrise = data[:current][:sunrise]
    @sunset = data[:current][:sunset]
    @uv_index = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @type = data[:current][:weather].first[:main]
    @icon = data[:current][:weather].first[:icon]
    @id = 1
  end

  def kelvin_to_fahrenheit(temp)
    (temp * 9/5 - 459.67).round
  end
end