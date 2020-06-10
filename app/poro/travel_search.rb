class TravelSearch
  def travel_data(origin, destination)
    travel_info = GoogleService.new.travel_info(origin, destination)
    TravelInfo.new(travel_info)
  end
end
