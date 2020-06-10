class Api::V1::ForecastController < ApplicationController
  def show
    return render json: { message: 'Location not given.' }, status: :bad_request if forecast_params[:location].blank?

    search_results = WeatherSearch.new
    weather = search_results.weather(forecast_params[:location])
    render json: ForecastSerializer.new(Forecast.new(weather))
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
