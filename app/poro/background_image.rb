class BackgroundImage
  attr_reader :url,
              :id

  def initialize(data)
    @url = data[:results].first[:urls][:raw]
    @id = 1
  end
end
