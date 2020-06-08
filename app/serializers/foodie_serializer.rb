class FoodieSerializer
  include FastJsonapi::ObjectSerializer
    attributes :travel,
               :forecast,
               :restaurant
end