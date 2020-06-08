class RestaurantSearch
  def restaurant(search, lat, lon)
    json = ZomatoService.new.find_restaurant(search, lat, lon)
    DestinationRestaurant.new(json)
  end
end