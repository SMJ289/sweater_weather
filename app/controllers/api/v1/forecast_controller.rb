class Api::V1::ForecastController < ApplicationController
  def show
    search_results = WeatherSearch.new
    weather = search_results.weather(params['location'])
    render json: ForecastSerializer.new(Forecast.new(weather))
  end
end