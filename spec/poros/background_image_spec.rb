require 'rails_helper'

RSpec.describe BackgroundImage, :vcr do
  before(:each) do
    json = UnsplashService.new.image_search('denver, co')
    @image = BackgroundImage.new(json)
  end

  describe 'instance methods' do
    it '#initialize()' do
      expect(@image.id).to eq(1)
      expect(@image.url).to eq("https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE0MDgwOH0")
    end
  end
end