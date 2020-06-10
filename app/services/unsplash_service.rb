class UnsplashService
  def image_search(location)
    resp = conn.get('search/photos') do |req|
      req.params['query'] = location
    end

    JSON.parse(resp.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://api.unsplash.com/',
      params: { client_id: ENV['UNSPLASH_API_KEY'] },
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
