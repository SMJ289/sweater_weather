class Coordinates
  def lat(location)
    json(location)[:results].first[:geometry][:location][:lat]
  end

  def lon(location)
    json(location)[:results].first[:geometry][:location][:lng]
  end

  def json(location)
    GoogleService.new.coordinates(location)
  end
end