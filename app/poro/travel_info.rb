class TravelInfo
  attr_reader :origin,
              :destination,
              :time_sec,
              :time_text

  def initialize(data)
    @origin = data[:routes].first[:legs].first[:start_address]
    @destination = data[:routes].first[:legs].first[:end_address]
    @time_sec = data[:routes].first[:legs].first[:duration][:value]
    @time_text = data[:routes].first[:legs].first[:duration][:text]
  end
end
