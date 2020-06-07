class Api::V1::ForecastController < ApplicationController
  def show
    google_conn = Faraday.new(
    url: 'https://maps.googleapis.com/',
    params: {key: 'AIzaSyDD_vRouggV2CZtkVOqkn3gqircvkGx89w'},
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
    params: {appid: '75837603333173536aeb4c7da22453a2'},
    headers: {'Content-Type' => 'application/json'}
    )

    weather_resp = weather_conn.get('data/2.5/onecall') do |req|
      req.params['lat'] = lat
      req.params['lon'] = lon
      req.params['exclude'] = 'minutely,hourly'
    end

    weather_json = JSON.parse(weather_resp.body, symbolize_names: true)

    current_temp = weather_json[:current][:temp]
    feels_like = weather_json[:current][:feels_like]
    humidity = weather_json[:current][:humidity]
    sunrise = weather_json[:current][:sunrise]
    sunset = weather_json[:current][:sunset]
    uv_index = weather_json[:current][:uvi]
    visibility = weather_json[:current][:visibility]
    type = weather_json[:current][:weather].first[:main]
    binding.pry
  end
end