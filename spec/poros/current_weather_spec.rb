require 'rails_helper'

RSpec.describe CurrentWeather do

  before(:each) do
    data = {:lat=>39.74,
            :lon=>-104.99,
            :timezone=>"America/Denver",
            :timezone_offset=>-21600,
            :current=>
              {:dt=>1591501730,
              :sunrise=>1591443141,
              :sunset=>1591496726,
              :temp=>290.96,
              :feels_like=>289.76,
              :pressure=>1004,
              :humidity=>51,
              :dew_point=>280.7,
              :uvi=>10.74,
              :clouds=>0,
              :visibility=>12856,
              :wind_speed=>0.89,
              :wind_deg=>135,
              :wind_gust=>1.79,
              :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
                :daily=>
                  [{:dt=>1591466400,
                    :sunrise=>1591443141,
                    :sunset=>1591496726,
                    :temp=>{:day=>290.96, :min=>290.96, :max=>293, :night=>293, :eve=>290.96, :morn=>290.96},
                    :feels_like=>{:day=>288.01, :night=>288.94, :eve=>288.01, :morn=>288.01},
                    :pressure=>1004,
                    :humidity=>51,
                    :dew_point=>280.7,
                    :wind_speed=>3.39,
                    :wind_deg=>204,
                    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
                    :clouds=>0,
                    :uvi=>10.74},
                  {:dt=>1591552800,
                    :sunrise=>1591529528,
                    :sunset=>1591583161,
                    :temp=>{:day=>302.16, :min=>291.5, :max=>305.22, :night=>296.01, :eve=>304.04, :morn=>291.5},
                    :feels_like=>{:day=>296.7, :night=>290.28, :eve=>294.74, :morn=>287.49},
                    :pressure=>1001,
                    :humidity=>14,
                    :dew_point=>270.17,
                    :wind_speed=>4.72,
                    :wind_deg=>201,
                    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
                    :clouds=>0,
                    :uvi=>11.08},
                  {:dt=>1591639200,
                    :sunrise=>1591615917,
                    :sunset=>1591669595,
                    :temp=>{:day=>294.62, :min=>282.91, :max=>301.32, :night=>282.91, :eve=>301.32, :morn=>286.66},
                    :feels_like=>{:day=>288.85, :night=>276.72, :eve=>293.14, :morn=>283.24},
                    :pressure=>1006,
                    :humidity=>27,
                    :dew_point=>275.16,
                    :wind_speed=>5.78,
                    :wind_deg=>114,
                    :weather=>[{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10d"}],
                    :clouds=>0,
                    :rain=>0.84,
                    :uvi=>9.11},
                  {:dt=>1591725600,
                    :sunrise=>1591702307,
                    :sunset=>1591756027,
                    :temp=>{:day=>291.5, :min=>281.82, :max=>294.04, :night=>289.2, :eve=>293.81, :morn=>281.82},
                    :feels_like=>{:day=>285.25, :night=>283.63, :eve=>286.18, :morn=>278.7},
                    :pressure=>1013,
                    :humidity=>25,
                    :dew_point=>266.93,
                    :wind_speed=>5.69,
                    :wind_deg=>322,
                    :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}],
                    :clouds=>26,
                    :uvi=>11.43},
                  {:dt=>1591812000,
                    :sunrise=>1591788699,
                    :sunset=>1591842457,
                    :temp=>{:day=>296.42, :min=>287.29, :max=>299.26, :night=>293.36, :eve=>299.15, :morn=>287.29},
                    :feels_like=>{:day=>293.34, :night=>289.86, :eve=>293.76, :morn=>283.67},
                    :pressure=>1017,
                    :humidity=>20,
                    :dew_point=>270.77,
                    :wind_speed=>1.37,
                    :wind_deg=>79,
                    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
                    :clouds=>6,
                    :uvi=>10.77},
                  {:dt=>1591898400,
                    :sunrise=>1591875093,
                    :sunset=>1591928886,
                    :temp=>{:day=>294.3, :min=>288.64, :max=>299.35, :night=>293, :eve=>299.35, :morn=>288.64},
                    :feels_like=>{:day=>290.9, :night=>290.12, :eve=>294.86, :morn=>283.24},
                    :pressure=>1022,
                    :humidity=>31,
                    :dew_point=>276.6,
                    :wind_speed=>2.8,
                    :wind_deg=>75,
                    :weather=>[{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10d"}],
                    :clouds=>1,
                    :rain=>0.65,
                    :uvi=>11.84},
                  {:dt=>1591988400,
                    :sunrise=>1591961489,
                    :sunset=>1592015314,
                    :temp=>{:day=>299.12, :min=>288.51, :max=>303.75, :night=>294.88, :eve=>303.15, :morn=>288.51},
                    :feels_like=>{:day=>296.76, :night=>293.7, :eve=>299.63, :morn=>286.78},
                    :pressure=>1019,
                    :humidity=>26,
                    :dew_point=>278.32,
                    :wind_speed=>1.76,
                    :wind_deg=>40,
                    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
                    :clouds=>0,
                    :uvi=>12.14},
                  {:dt=>1592074800,
                    :sunrise=>1592047887,
                    :sunset=>1592101740,
                    :temp=>{:day=>301.9, :min=>291.48, :max=>308.13, :night=>293.45, :eve=>305.27, :morn=>291.48},
                    :feels_like=>{:day=>300.18, :night=>292.1, :eve=>302.06, :morn=>291.08},
                    :pressure=>1012,
                    :humidity=>28,
                    :dew_point=>281.67,
                    :wind_speed=>1.94,
                    :wind_deg=>31,
                    :weather=>[{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10d"}],
                    :clouds=>54,
                    :rain=>0.96,
                    :uvi=>10.33}]}
    @current_weather = CurrentWeather.new(data)
  end

  it '.initialize()' do
    expect(@current_weather.current_temp).to eq(290.96)
    expect(@current_weather.feels_like).to eq(62)
    expect(@current_weather.high).to eq(67)
    expect(@current_weather.low).to eq(64)
    expect(@current_weather.type).to eq('Clear')
    expect(@current_weather.humidity).to eq(51)
    expect(@current_weather.visibility).to eq(12856)
    expect(@current_weather.uv_index).to eq(10.74)
    expect(@current_weather.sunrise).to eq(1591443141)
    expect(@current_weather.sunset).to eq(1591496726)
  end

  it '.kelvin_to_fahrenheit()' do
    expect(@current_weather.kelvin_to_fahrenheit(300)).to eq(80)
  end
end