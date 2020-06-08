class ZomatoService
  def find_restaurant(search, lat, lon)
    search = 55 if search == 'italian'

    response = conn.get('search') do |req|
      req.params['lat'] = lat
      req.params['lon'] = lon
      req.params['cuisines'] = search
      req.params['count'] = 1
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://developers.zomato.com/api/v2.1/',
      headers: {'user-key' => ENV['ZOMATO_API_KEY']}
    )
  end
end