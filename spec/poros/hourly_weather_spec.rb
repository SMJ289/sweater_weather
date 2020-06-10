require 'rails_helper'

RSpec.describe DailyWeather, :vcr do

  before(:each) do
    search_results = WeatherSearch.new
    weather = search_results.weather('Nashville, TN')
    @hourly_weather = weather[:hourly].map do |hour|
                        HourlyWeather.new(hour)
                      end
  end

  it '.initialize()' do
    expect(@hourly_weather.length).to eq(48)
    expect(@hourly_weather.first.temp).to eq(83)
    expect(@hourly_weather.first.icon).to eq("04d")
    expect(@hourly_weather.first.time).to eq(" 7 PM")
  end

  it '.kelvin_to_fahrenheit()' do
    expect(@hourly_weather.first.kelvin_to_fahrenheit(300)).to eq(80)
  end

  it '.format_time()' do
    expect(@hourly_weather.first.format_time(1591560000, '%l %p')).to eq(" 2 PM")
  end
end