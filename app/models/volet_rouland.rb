class VoletRouland < ActiveRecord::Base
  has_one :product, as: :detail

  def title
  end

  def to_s
  end

end
