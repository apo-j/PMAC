class Store < ActiveRecord::Base
  has_one :product, as: :detail

  def title
  end

  def to_s
    'Store'
  end

end
