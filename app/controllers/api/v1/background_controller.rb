class Api::V1::BackgroundController < ApplicationController
  def show
    conn = Faraday.new(
      url: 'https://api.unsplash.com/',
      params: {client_id: ENV['UNSPLASH_API_KEY']},
      headers: {'Content-Type' => 'application/json'}
    )

    resp = conn.get('search/photos') do |req|
      req.params['query'] = params['location']
    end

    json = JSON.parse(resp.body, symbolize_names: true)
    background_image = BackgroundImage.new(json)
    render json: BackgroundImageSerializer.new(background_image)
    binding.pry
  end
end