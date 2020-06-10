class RoadTrip
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_temp,
              :arrival_weather_type,
              :id

  def initialize(weather, travel)
    @origin = travel.origin
    @destination = travel.destination
    @travel_time = travel.time_text
    @arrival_temp = weather(weather, travel).temp
    @arrival_weather_type = weather(weather, travel).description
    @id = 1
  end

  def weather(weather, travel)
    ArrivalWeather.new(weather, travel)
  end
end
