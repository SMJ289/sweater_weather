class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
    attributes :origin,
               :destination,
               :travel_time,
               :arrival_temp,
               :arrival_weather_type
end