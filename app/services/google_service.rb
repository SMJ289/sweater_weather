class GoogleService
  def coordinates(address)
    response = conn.get('maps/api/geocode/json') do |req|
      req.params['address'] = address
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/',
      params: {key: ENV['GOOGLE_API_KEY']},
      headers: {'Content-Type' => 'application/json'}
      )
  end
end