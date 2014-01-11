class Navbar < ActiveRecord::Base
  belongs_to :parent, class_name: 'Navbar'
  has_many :children, class_name: 'Navbar', foreign_key: 'parent_id'
  scope :get_navbar_root_items, ->{where('is_top = ?', true).order(:order)}
  scope :by_code, ->(code){where('code = ?', code)}
end
