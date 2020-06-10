require 'rails_helper'

RSpec.describe CurrentWeather, :vcr do
  before(:each) do
    search_results = WeatherSearch.new
    weather = search_results.weather('Nashville, TN')
    @current_weather = CurrentWeather.new(weather)
  end

  it '.initialize()' do
    expect(@current_weather.date).to eq("June 09")
    expect(@current_weather.time).to eq("07:32 PM")
    expect(@current_weather.current_temp).to eq(83)
    expect(@current_weather.feels_like).to eq(87)
    expect(@current_weather.high).to eq(83)
    expect(@current_weather.low).to eq(80)
    expect(@current_weather.type).to eq("Clouds")
    expect(@current_weather.icon).to eq("04n")
    expect(@current_weather.humidity).to eq(70)
    expect(@current_weather.visibility).to eq(10)
    expect(@current_weather.uv_index).to eq(11.05)
    expect(@current_weather.sunrise).to eq("04:29 AM")
    expect(@current_weather.sunset).to eq("07:03 PM")
  end

  it '.kelvin_to_fahrenheit()' do
    expect(@current_weather.kelvin_to_fahrenheit(300)).to eq(80)
  end

  it '.format_time()' do
    expect(@current_weather.format_time(1591501730)).to eq("09:48 PM")
  end

  it '.format_date()' do
    expect(@current_weather.format_date(1591501730)).to eq("June 06")
  end

  it '.meters_to_miles()' do
    expect(@current_weather.meters_to_miles(15000)).to eq(9)
  end
end