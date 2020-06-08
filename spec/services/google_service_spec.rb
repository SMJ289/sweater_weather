require 'rails_helper'

RSpec.describe GoogleService do
  describe 'intance methods' do
    context '#coordinates()' do
      it 'returns coordinates' do
        service = GoogleService.new
        search = service.coordinates('portland, or')

        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        geo_data = search[:results].first[:geometry][:location]
        
        expect(geo_data). to have_key :lat
        expect(geo_data). to have_key :lng
      end
    end
  end
end