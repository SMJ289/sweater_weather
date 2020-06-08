class DestinationWeather
  attr_reader :current_temp,
              :summary

  def initialize(data)
    @current_temp = kelvin_to_fahrenheit(data[:current][:temp])
    @summary = data[:current][:weather].first[:description]
  end

  def kelvin_to_fahrenheit(temp)
    (temp * 9/5 - 459.67).round
  end
end