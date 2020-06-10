require 'rails_helper'

RSpec.describe DailyWeather, :vcr do
  before(:each) do
    search_results = WeatherSearch.new
    weather = search_results.weather('Nashville, TN')
    @daily_weather = weather[:daily].map do |day|
                      DailyWeather.new(day)
                    end
  end

  it '.initialize()' do
    expect(@daily_weather.length).to eq(8)
    expect(@daily_weather.first.high).to eq(83)
    expect(@daily_weather.first.low).to eq(80)
    expect(@daily_weather.first.type).to eq("Clouds")
    expect(@daily_weather.first.icon).to eq("04d")
    expect(@daily_weather.first.rain).to eq(nil)
    expect(@daily_weather.first.date).to eq("Tuesday, Jun 09")
  end

  it '.kelvin_to_fahrenheit()' do
    expect(@daily_weather.first.kelvin_to_fahrenheit(300)).to eq(80)
  end

  it '.format_date()' do
    expect(@daily_weather.first.format_date(1591466400)).to eq("Saturday, Jun 06")
  end
end