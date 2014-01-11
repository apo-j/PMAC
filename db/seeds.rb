# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Navbar.delete_all
Material.delete_all
Color.delete_all
# . . .
Product.create(title: 'Programming Ruby 1.9  2.0', price: 14.98)
Product.create(title: 'Nothing to say', price: 32.76)


Navbar.create(name: 'Accueil', code: 'home', is_top: true, url: '/', order: 0)
Navbar.create(name: 'PVC', code: 'pvc', is_top: true, order: 1)
Navbar.create(name: 'Aluminium', code:'aluminium', is_top: true, order: 2)

rs = Navbar.by_code('pvc')
unless rs.empty?
  Navbar.create(name: 'Neuf', code: 'neuf', is_top: false, parent_id: rs[0].id, order: 0, url: '/configurator/pvc/neuf')
  Navbar.create(name: 'Renovation', code: 'renovation', is_top: false, parent_id: rs[0].id, order: 1, url: '/configurator/pvc/renovation')
end

rs = Navbar.by_code('aluminium')
unless rs.empty?
  Navbar.create(name: 'Neuf', code: 'neuf', is_top: false, parent_id: rs[0].id, order: 0, url: '/configurator/aluminium/neuf')
  Navbar.create(name: 'Renovation', code: 'renovation', is_top: false, parent_id: rs[0].id, order: 1, url: '/configurator/aluminium/renovation')
end

Material.create(name:'PVC', code: 'pvc')
Material.create(name: 'Aluminium', code: 'aluminium')

Color.create(name: 'Blanc', code: 'blanc', price: 0)
Color.create(name: 'Acajou', code: 'acajou', price: 20)
Color.create(name: "Oak d'orée", code: "oak d'orée", price: 20)
Color.create(name: 'Noyer', code: 'noyer', price: 20)
Color.create(name: 'Anthracite', code: 'anthracite', price: 20)
# . . .