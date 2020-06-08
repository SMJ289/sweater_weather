class Api::V1::BackgroundController < ApplicationController
  def show
    search_results = BackgroundImageSearch.new
    background_image = search_results.image(params['location'])
    render json: BackgroundImageSerializer.new(background_image)
  end
end