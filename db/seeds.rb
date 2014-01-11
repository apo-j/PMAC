# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Navbar.delete_all
# . . .
Product.create(title: 'Programming Ruby 1.9  2.0', price: 14.98)
Product.create(title: 'Nothing to say', price: 32.76)

Navbar.create(name: 'PVC', code: 'pvc', is_top: true)
Navbar.create(name: 'Aluminium', code:'aluminium', is_top: true)

rs = Navbar.by_code('pvc')
unless rs.empty?
  Navbar.create(name: 'Neuf', code: 'neuf', is_top: false, parent_id: rs[0].id)
  Navbar.create(name: 'Renovation', code: 'renovation', is_top: false, parent_id: rs[0].id)
end

rs = Navbar.by_code('aluminium')
unless rs.empty?
  Navbar.create(name: 'Neuf', code: 'neuf', is_top: false, parent_id: rs[0].id)
  Navbar.create(name: 'Renovation', code: 'renovation', is_top: false, parent_id: rs[0].id)
end

# . . .