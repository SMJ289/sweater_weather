class Api::V1::RoadTripController < ApplicationController
  def show
    return render json: {message: 'One or more fields missing.'}, status: 400 if params_missing?
    
    if User.exists?(api_key: road_trip_params[:api_key])
      render json: RoadTripSerializer.new(trip_info)
    else
      render json: {}, status: 401
    end
  end

  private
  
  def road_trip_params
    params.permit(:api_key, :destination, :origin)
  end

  def trip_info
    search_results = WeatherSearch.new
    weather = search_results.weather(road_trip_params[:destination])
    travel_search = TravelSearch.new
    travel = travel_search.travel_data(road_trip_params[:origin], road_trip_params[:destination])
    RoadTrip.new(weather, travel)
  end

  def params_missing?
    road_trip_params.values.any?{ |value| value.blank? }
  end 
end
