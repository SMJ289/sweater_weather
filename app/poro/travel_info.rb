class TravelInfo
  attr_reader :destination_address,
              :destination_lat,
              :destination_lng,
              :travel_time_seconds

  def initialize(data)
    @destination_address = data[:routes].first[:legs].first[:end_address]
    @destination_lat = data[:routes].first[:legs].first[:end_location][:lat]
    @destination_lng = data[:routes].first[:legs].first[:end_location][:lng]
    @travel_time_seconds = data[:routes].first[:legs].first[:duration][:value]
  end
end
