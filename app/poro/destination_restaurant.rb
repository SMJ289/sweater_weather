class DestinationRestaurant
  attr_reader :name,
              :address

  def initialize(data)
    @name = data[:restaurants].first[:restaurant][:name]
    @address = data[:restaurants].first[:restaurant][:location][:address]
  end
end
