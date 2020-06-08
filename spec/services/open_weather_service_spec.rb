require 'rails_helper'

RSpec.describe OpenWeatherService do
  describe 'intance methods' do
    context '#weather()' do
      it 'returns weather forecast', :vcr do
        service = OpenWeatherService.new
        search = service.weather('portland, or')

        expect(search).to be_a Hash
        expect(search). to have_key :current
        expect(search). to have_key :hourly
        expect(search). to have_key :daily
      end
    end
  end
end