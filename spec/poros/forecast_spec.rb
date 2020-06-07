require 'rails_helper'

RSpec.describe DailyWeather do

  before(:each) do
    data = {:lat=>39.74, :lon=>-104.99, :timezone=>"America/Denver", :timezone_offset=>-21600, :current=>
        {:dt=>1591561329, :sunrise=>1591529528, :sunset=>1591583161, :temp=>303.62, :feels_like=>297.92, :pressure=>999, :humidity=>10, :dew_point=>269.12, :uvi=>10.74, :clouds=>0, :wind_speed=>4.47, :wind_deg=>160, :wind_gust=>7.6, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, :hourly=>[
          {:dt=>1591560000, :temp=>303.62, :feels_like=>293.68, :pressure=>999, :humidity=>10, :dew_point=>269.12, :clouds=>0, :wind_speed=>10.53, :wind_deg=>193, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591563600, :temp=>304.35, :feels_like=>294.64, :pressure=>998, :humidity=>11, :dew_point=>270.74, :clouds=>0, :wind_speed=>10.5, :wind_deg=>202, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591567200, :temp=>304.76, :feels_like=>294.96, :pressure=>997, :humidity=>12, :dew_point=>272.06, :clouds=>0, :wind_speed=>10.91, :wind_deg=>202, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591570800, :temp=>304.84, :feels_like=>295.44, :pressure=>996, :humidity=>12, :dew_point=>272.12, :clouds=>0, :wind_speed=>10.35, :wind_deg=>208, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591574400, :temp=>303.76, :feels_like=>294.45, :pressure=>997, :humidity=>13, :dew_point=>272.34, :clouds=>0, :wind_speed=>10.27, :wind_deg=>208, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591578000, :temp=>302.6, :feels_like=>294.84, :pressure=>998, :humidity=>14, :dew_point=>270.86, :clouds=>0, :wind_speed=>8.07, :wind_deg=>216, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591581600, :temp=>300.83, :feels_like=>293.14, :pressure=>1000, :humidity=>15, :dew_point=>270.79, :clouds=>0, :wind_speed=>7.89, :wind_deg=>228, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591585200, :temp=>299.26, :feels_like=>292.15, :pressure=>1001, :humidity=>17, :dew_point=>271.53, :clouds=>0, :wind_speed=>7.15, :wind_deg=>224, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591588800, :temp=>297.89, :feels_like=>290.14, :pressure=>1002, :humidity=>18, :dew_point=>269.16, :clouds=>0, :wind_speed=>7.99, :wind_deg=>228, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591592400, :temp=>296.88, :feels_like=>288.61, :pressure=>1003, :humidity=>18, :dew_point=>267.12, :clouds=>0, :wind_speed=>8.59, :wind_deg=>214, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591596000, :temp=>295.99, :feels_like=>288.97, :pressure=>1004, :humidity=>19, :dew_point=>266.91, :clouds=>0, :wind_speed=>6.8, :wind_deg=>219, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591599600, :temp=>294.9, :feels_like=>289.06, :pressure=>1004, :humidity=>20, :dew_point=>266.25, :clouds=>0, :wind_speed=>5.08, :wind_deg=>230, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591603200, :temp=>294.18, :feels_like=>288.01, :pressure=>1005, :humidity=>20, :dew_point=>263.89, :clouds=>0, :wind_speed=>5.45, :wind_deg=>216, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591606800, :temp=>293.46, :feels_like=>289.15, :pressure=>1006, :humidity=>20, :dew_point=>262.36, :clouds=>0, :wind_speed=>2.68, :wind_deg=>216, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591610400, :temp=>292.5, :feels_like=>289, :pressure=>1007, :humidity=>22, :dew_point=>263.82, :clouds=>0, :wind_speed=>1.61, :wind_deg=>82, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591614000, :temp=>290.55, :feels_like=>286.2, :pressure=>1008, :humidity=>27, :dew_point=>266.58, :clouds=>0, :wind_speed=>3.02, :wind_deg=>42, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}, 
        {:dt=>1591617600, :temp=>288.76, :feels_like=>284.79, :pressure=>1009, :humidity=>33, :dew_point=>271.16, :clouds=>0, :wind_speed=>2.71, :wind_deg=>40, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591621200, :temp=>288.28, :feels_like=>283.31, :pressure=>1009, :humidity=>35, :dew_point=>273.33, :clouds=>0, :wind_speed=>4.22, :wind_deg=>80, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591624800, :temp=>288.69, :feels_like=>284.5, :pressure=>1009, :humidity=>36, :dew_point=>273.72, :clouds=>0, :wind_speed=>3.26, :wind_deg=>101, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591628400, :temp=>290.62, :feels_like=>286.77, :pressure=>1008, :humidity=>30, :dew_point=>272.86, :clouds=>0, :wind_speed=>2.6, :wind_deg=>122, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591632000, :temp=>293.19, :feels_like=>288.57, :pressure=>1007, :humidity=>25, :dew_point=>271.33, :clouds=>0, :wind_speed=>3.64, :wind_deg=>118, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591635600, :temp=>295.6, :feels_like=>290.41, :pressure=>1007, :humidity=>20, :dew_point=>268.73, :clouds=>0, :wind_speed=>4.26, :wind_deg=>129, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591639200, :temp=>298.03, :feels_like=>291.78, :pressure=>1006, :humidity=>16, :dew_point=>263.95, :clouds=>0, :wind_speed=>5.58, :wind_deg=>173, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591642800, :temp=>299.56, :feels_like=>292.03, :pressure=>1005, :humidity=>14, :dew_point=>261.74, :clouds=>0, :wind_speed=>7.31, :wind_deg=>189, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591646400, :temp=>300.25, :feels_like=>293.32, :pressure=>1004, :humidity=>15, :dew_point=>266.5, :clouds=>0, :wind_speed=>6.72, :wind_deg=>157, :weather=>[
          {:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}, 
        {:dt=>1591650000, :temp=>299.97, :feels_like=>292.68, :pressure=>1003, :humidity=>16, :dew_point=>271.59, :clouds=>19, :wind_speed=>7.35, :wind_deg=>127, :weather=>[
          {:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}, 
        {:dt=>1591653600, :temp=>300.85, :feels_like=>294.94, :pressure=>1002, :humidity=>14, :dew_point=>268.1, :clouds=>39, :wind_speed=>5.17, :wind_deg=>128, :weather=>[
          {:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]}, 
        {:dt=>1591657200, :temp=>301.42, :feels_like=>292.59, :pressure=>1003, :humidity=>13, :dew_point=>265.12, :clouds=>51, :wind_speed=>9.24, :wind_deg=>163, :weather=>[
          {:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]}, 
        {:dt=>1591660800, :temp=>299.55, :feels_like=>292.23, :pressure=>1004, :humidity=>15, :dew_point=>266.83, :clouds=>59, :wind_speed=>7.17, :wind_deg=>276, :weather=>[
          {:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]}, 
        {:dt=>1591664400, :temp=>291.48, :feels_like=>279.38, :pressure=>1007, :humidity=>37, :dew_point=>276.85, :clouds=>99, :wind_speed=>15.24, :wind_deg=>359, :weather=>[
          {:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]}, 
        {:dt=>1591668000, :temp=>288.5, :feels_like=>281.23, :pressure=>1010, :humidity=>46, :dew_point=>277.19, :clouds=>98, :wind_speed=>8.44, :wind_deg=>14, :weather=>[
          {:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]}, 
        {:dt=>1591671600, :temp=>285.84, :feels_like=>279.01, :pressure=>1013, :humidity=>60, :dew_point=>278.48, :clouds=>98, :wind_speed=>8.19, :wind_deg=>15, :weather=>[
          {:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10n"}], :rain=>
        {:"1h"=>0.19}}, 
        {:dt=>1591675200, :temp=>282.44, :feels_like=>275.03, :pressure=>1016, :humidity=>53, :dew_point=>273.53, :clouds=>98, :wind_speed=>7.79, :wind_deg=>320, :weather=>[
          {:id=>501, :main=>"Rain", :description=>"moderate rain", :icon=>"10n"}], :rain=>
        {:"1h"=>1.42}}, 
        {:dt=>1591678800, :temp=>282.33, :feels_like=>275.54, :pressure=>1017, :humidity=>54, :dew_point=>273.62, :clouds=>98, :wind_speed=>6.94, :wind_deg=>344, :weather=>[
          {:id=>501, :main=>"Rain", :description=>"moderate rain", :icon=>"10n"}], :rain=>
        {:"1h"=>2.37}}, 
        {:dt=>1591682400, :temp=>280.49, :feels_like=>276.81, :pressure=>1018, :humidity=>69, :dew_point=>275.31, :clouds=>99, :wind_speed=>2.88, :wind_deg=>9, :weather=>[
          {:id=>501, :main=>"Rain", :description=>"moderate rain", :icon=>"10n"}], :rain=>
        {:"1h"=>3.01}}, 
        {:dt=>1591686000, :temp=>280.78, :feels_like=>278.31, :pressure=>1018, :humidity=>68, :dew_point=>275.27, :clouds=>100, :wind_speed=>1.16, :wind_deg=>123, :weather=>[
          {:id=>501, :main=>"Rain", :description=>"moderate rain", :icon=>"10n"}], :rain=>
        {:"1h"=>1.43}}, 
        {:dt=>1591689600, :temp=>282, :feels_like=>277.84, :pressure=>1018, :humidity=>59, :dew_point=>274.64, :clouds=>100, :wind_speed=>3.38, :wind_deg=>190, :weather=>[
          {:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}]}, 
        {:dt=>1591693200, :temp=>282.36, :feels_like=>278.16, :pressure=>1017, :humidity=>55, :dew_point=>273.93, :clouds=>100, :wind_speed=>3.3, :wind_deg=>188, :weather=>[
          {:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}]}, 
        {:dt=>1591696800, :temp=>283.83, :feels_like=>279.13, :pressure=>1018, :humidity=>45, :dew_point=>271.08, :clouds=>99, :wind_speed=>3.72, :wind_deg=>262, :weather=>[
          {:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}]}, 
        {:dt=>1591700400, :temp=>284.35, :feels_like=>278.83, :pressure=>1018, :humidity=>43, :dew_point=>269.48, :clouds=>81, :wind_speed=>4.86, :wind_deg=>296, :weather=>[
          {:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04n"}]}, 
        {:dt=>1591704000, :temp=>284.54, :feels_like=>279.82, :pressure=>1019, :humidity=>42, :dew_point=>269.07, :clouds=>75, :wind_speed=>3.69, :wind_deg=>290, :weather=>[
          {:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]}, 
        {:dt=>1591707600, :temp=>285, :feels_like=>279.95, :pressure=>1018, :humidity=>40, :dew_point=>268.82, :clouds=>98, :wind_speed=>4.11, :wind_deg=>304, :weather=>[
          {:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]}, {:dt=>1591711200, :temp=>286.07, :feels_like=>281.32, :pressure=>1018, :humidity=>37, :dew_point=>268.4, :clouds=>49, :wind_speed=>3.67, :wind_deg=>305, :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]}, {:dt=>1591714800, :temp=>287.41, :feels_like=>282.29, :pressure=>1017, :humidity=>33, :dew_point=>266.96, :clouds=>32, :wind_speed=>4.13, :wind_deg=>288, :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}]}, {:dt=>1591718400, :temp=>288.47, :feels_like=>281.81, :pressure=>1016, :humidity=>30, :dew_point=>266.09, :clouds=>24, :wind_speed=>6.25, :wind_deg=>297, :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}, {:dt=>1591722000, :temp=>289.66, :feels_like=>282.11, :pressure=>1015, :humidity=>27, :dew_point=>264.18, :clouds=>20, :wind_speed=>7.45, :wind_deg=>309, :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}, {:dt=>1591725600, :temp=>291.08, :feels_like=>283.82, :pressure=>1014, :humidity=>25, :dew_point=>264.66, :clouds=>17, :wind_speed=>7.07, :wind_deg=>312, :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}, {:dt=>1591729200, :temp=>292.4, :feels_like=>284.78, :pressure=>1014, :humidity=>24, :dew_point=>266.52, :clouds=>0, :wind_speed=>7.69, :wind_deg=>308, :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]}], :daily=>[{:dt=>1591552800, :sunrise=>1591529528, :sunset=>1591583161, :temp=>{:day=>303.62, :min=>296.05, :max=>304.35, :night=>296.05, :eve=>303.73, :morn=>303.62}, :feels_like=>{:day=>294.24, :night=>289.04, :eve=>294.42, :morn=>294.24}, :pressure=>999, :humidity=>10, :dew_point=>269.12, :wind_speed=>9.74, :wind_deg=>195, :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}], :clouds=>0, :uvi=>10.74}, {:dt=>1591639200, :sunrise=>1591615917, :sunset=>1591669595, :temp=>{:day=>298.03, :min=>280.49, :max=>299.97, :night=>280.49, :eve=>299.55, :morn=>288.76}, :feels_like=>{:day=>291.78, :night=>276.81, :eve=>292.23, :morn=>284.79}, :pressure=>1006, :humidity=>16, :dew_point=>263.95, :wind_speed=>5.58, :wind_deg=>173, :weather=>[{:id=>501, :main=>"Rain", :description=>"moderate rain", :icon=>"10d"}], :clouds=>0, :rain=>7.04, :uvi=>11.08}, {:dt=>1591725600, :sunrise=>1591702307, :sunset=>1591756027, :temp=>{:day=>291.08, :min=>284.54, :max=>294.53, :night=>290.43, :eve=>294.51, :morn=>284.54}, :feels_like=>{:day=>283.82, :night=>286.09, :eve=>287.75, :morn=>279.82}, :pressure=>1014, :humidity=>25, :dew_point=>264.66, :wind_speed=>7.07, :wind_deg=>312, :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}], :clouds=>17, :uvi=>9.11}, {:dt=>1591812000, :sunrise=>1591788699, :sunset=>1591842457, :temp=>{:day=>297.55, :min=>287.46, :max=>300.8, :night=>293.76, :eve=>300.09, :morn=>287.46}, :feels_like=>{:day=>293.06, :night=>290.7, :eve=>293.54, :morn=>283.91}, :pressure=>1017, :humidity=>18, :dew_point=>268.79, :wind_speed=>3.28, :wind_deg=>324, :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}], :clouds=>64, :uvi=>11.43}, {:dt=>1591898400, :sunrise=>1591875093, :sunset=>1591928886, :temp=>{:day=>301.01, :min=>290.47, :max=>303.46, :night=>297, :eve=>303.19, :morn=>290.47}, :feels_like=>{:day=>298.04, :night=>293.06, :eve=>298.06, :morn=>287.31}, :pressure=>1020, :humidity=>15, :dew_point=>270.42, :wind_speed=>1.17, :wind_deg=>68, :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}], :clouds=>0, :uvi=>10.77}, {:dt=>1591988400, :sunrise=>1591961489, :sunset=>1592015314, :temp=>{:day=>303.62, :min=>293.02, :max=>305.89, :night=>295.89, :eve=>304.23, :morn=>293.02}, :feels_like=>{:day=>299.85, :night=>292.63, :eve=>297.66, :morn=>290.89}, :pressure=>1018, :humidity=>14, :dew_point=>274.06, :wind_speed=>2.54, :wind_deg=>144, :weather=>[{:id=>501, :main=>"Rain", :description=>"moderate rain", :icon=>"10d"}], :clouds=>0, :rain=>3.22, :uvi=>11.84}, {:dt=>1592074800, :sunrise=>1592047887, :sunset=>1592101740, :temp=>{:day=>304.91, :min=>293.3, :max=>308.02, :night=>294.64, :eve=>303.99, :morn=>293.3}, :feels_like=>{:day=>300.04, :night=>291.75, :eve=>298.12, :morn=>290.75}, :pressure=>1009, :humidity=>12, :dew_point=>272.14, :wind_speed=>3.88, :wind_deg=>159, :weather=>[{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10d"}], :clouds=>100, :rain=>2.16, :uvi=>12.14}, {:dt=>1592161200, :sunrise=>1592134287, :sunset=>1592188164, :temp=>{:day=>304.74, :min=>293.07, :max=>306.69, :night=>304.6, :eve=>304.6, :morn=>293.07}, :feels_like=>{:day=>298.79, :night=>300.26, :eve=>300.26, :morn=>289.23}, :pressure=>1006, :humidity=>11, :dew_point=>267.73, :wind_speed=>5.19, :wind_deg=>197, :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}], :clouds=>20, :uvi=>10.33}]}

    @forecast = Forecast.new(data)
  end

  it '.initialize()' do
    expect(@forecast.current.class).to eq(CurrentWeather)
    expect(@forecast.hourly.class).to eq(Array)
    expect(@forecast.hourly.first.class).to eq(HourlyWeather)
    expect(@forecast.daily.class).to eq(Array)
    expect(@forecast.daily.first.class).to eq(DailyWeather)
    expect(@forecast.id).to eq(1)
  end
end