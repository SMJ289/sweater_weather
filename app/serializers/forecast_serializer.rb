class ForecastSerializer
  include FastJsonapi::ObjectSerializer
    attributes :current,
               :daily,
               :hourly
end