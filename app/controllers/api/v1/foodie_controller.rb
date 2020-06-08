class Api::V1::FoodieController < ApplicationController
  def show

    travel_info = GoogleService.new.travel_info(params['start'], params['end'])
    binding.pry
  end

end