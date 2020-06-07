class Api::V1::ForecastController < ApplicationController
  def show
    search_results = WeatherSearch.new
    weather = search_results.weather(params['location'])
    forecast = Forecast.new(weather)
    render json: ForecastSerializer.new(forecast)
  end
end