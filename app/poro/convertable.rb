module Convertable
  def kelvin_to_fahrenheit(temp)
    (temp * 9 / 5 - 459.67).round
  end

  def meters_to_miles(meters)
    return 'n/a' if meters.nil?

    (meters / 1609).round
  end

  def format_date(datetime, format)
    Time.zone.at(datetime).strftime(format)
  end

  def format_time(datetime, format)
    Time.zone.at(datetime).strftime(format)
  end
end
