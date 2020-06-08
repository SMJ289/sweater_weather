class BackgroundImageSearch
  def image(location)
    json = UnsplashService.new.image_search(location)
    BackgroundImage.new(json)
  end
end