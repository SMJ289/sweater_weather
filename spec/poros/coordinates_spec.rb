require 'rails_helper'

RSpec.describe Coordinates do
  describe 'intance methods' do
    context '#lat()' do
      it 'returns the lattitude', :vcr do
        search = Coordinates.new
        lat = search.lat('portland, or')

        expect(lat).to eq(45.5051064)
      end
    end
    
    context '#lon()' do
      it 'returns the longitude', :vcr do
        search = Coordinates.new
        lon = search.lon('portland, or')

        expect(lon).to eq(-122.6750261)
      end
    end
  end
end