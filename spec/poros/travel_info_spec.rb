require 'rails_helper'

RSpec.describe TravelInfo do
  describe 'instance methods' do
    it '#initialize()', :vcr do
      travel_info = GoogleService.new.travel_info('denver, co', 'larimie, wy')
      travel_info = TravelInfo.new(travel_info)
      
      expect(travel_info.origin).to eq("Denver, CO, USA")
      expect(travel_info.destination).to eq("Laramie, WY, USA")
      expect(travel_info.time_sec).to be_present
      expect(travel_info.time_text).to be_present
    end
  end
end