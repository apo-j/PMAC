class RideauxMetalique < ActiveRecord::Base
  has_one :product, as: :detail
end
