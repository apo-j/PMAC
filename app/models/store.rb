class Store < ActiveRecord::Base
  has_one :product, as: :detail
end