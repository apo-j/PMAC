class Pvc < ActiveRecord::Base
  has_one :product, as: :detail

  def title
    chassis
  end

  def to_html
    :PVC
  end
end
