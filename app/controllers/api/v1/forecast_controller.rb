class Api::V1::ForecastController < ApplicationController
  def show
    google_conn = Faraday.new(
    url: 'https://maps.googleapis.com/',
    params: {key: ENV['GOOGLE_API_KEY']},
    headers: {'Content-Type' => 'application/json'}
    )

    google_resp = google_conn.get('maps/api/geocode/json') do |req|
      req.params['address'] = params['location']
    end

    google_json = JSON.parse(google_resp.body, symbolize_names: true)
    lat = google_json[:results].first[:geometry][:location][:lat]
    lon = google_json[:results].first[:geometry][:location][:lng]

    weather_conn = Faraday.new(
    url: 'https://api.openweathermap.org/',
    params: {appid: ENV['WEATHER_API_KEY']},
    headers: {'Content-Type' => 'application/json'}
    )

    weather_resp = weather_conn.get('data/2.5/onecall') do |req|
      req.params['lat'] = lat
      req.params['lon'] = lon
      req.params['exclude'] = 'minutely'
    end

    weather_json = JSON.parse(weather_resp.body, symbolize_names: true)

    forecast = Forecast.new(weather_json)

    render json: ForecastSerializer.new(forecast)

  end
end