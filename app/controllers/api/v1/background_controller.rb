class Api::V1::BackgroundController < ApplicationController
  def show
    return render json: { message: 'Location not given.' }, status: :bad_request if background_params[:location].blank?
    search_results = BackgroundImageSearch.new
    background_image = search_results.image(background_params[:location])
    render json: BackgroundImageSerializer.new(background_image)
  end

  private

  def background_params
    params.permit(:location)
  end
end
