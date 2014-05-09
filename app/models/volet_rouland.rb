class VoletRouland < ActiveRecord::Base
  has_one :product, as: :detail
end
