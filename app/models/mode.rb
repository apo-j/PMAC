class Mode < ActiveRecord::Base
  belongs_to :price
  scope :by_code, ->(code){where('code = ?', code).includes(:price)}
end
