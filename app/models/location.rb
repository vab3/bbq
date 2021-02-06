class Location < ApplicationRecord
  belongs_to :vendor
  enum location_type: { restaurant: 0, food_truck: 1 }
end
