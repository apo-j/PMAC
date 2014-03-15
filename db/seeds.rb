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
Mode.delete_all
Price.delete_all
Carousel.delete_all
# . . .
Product.create(title: 'Programming Ruby 1.9  2.0', price: 14.98)
Product.create(title: 'Nothing to say', price: 32.76)


Navbar.create(name: 'Accueil', picture:'glyphicon glyphicon-home' ,code: 'home', is_top: true, url: '/', order: 0)
Navbar.create(name: 'PVC', code: 'pvc', is_top: true, order: 1)
Navbar.create(name: 'Aluminium', code:'aluminium', is_top: true, order: 2)
Navbar.create(name: 'Volet Roulants', code:'VR', is_top: true, order: 3)
Navbar.create(name: 'Volet Battand', code:'VB', is_top: true, order: 4)
Navbar.create(name: 'Store', code:'store', is_top: true, order: 5)
Navbar.create(name: 'Rideaux Métalique', code:'RM', is_top: true, order: 6)
Navbar.create(name: 'Accessoires', code:'accessoires', is_top: true, order: 7)




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
Color.create(name: 'Irish Oak', code: 'irish oak', price: 30)
Color.create(name: 'Golden Beech', code: 'golden beech', price: 30)
Color.create(name: 'Golden Oak', code: 'golden oak', price: 30)
Color.create(name: 'Chêne fincé', code: 'chêne fincé', price: 30)
Color.create(name: 'Acajou', code: 'acajou', price: 30)
Color.create(name: 'Bleu acier grainé', code: 'bleu acier grainé', price: 30)
Color.create(name: 'Gris anthracite grainé', code: 'gris anthracite grainé', price: 30)



price01 = Price.create(widths:'50|60|70|80|90|100|110|120|130|140|150|160', heights:'45|55|65|75|85|95', prices:'220|257|263|268|279|285|294|300|305|313|321|329|225|262|267|276|284|292|299|304|313|322|331|340|232|267|276|282|291|299|307|318|329|339|349|359|238|276|281|289|298|309|320|331|341|353|366|378|249|285|292|300|315|328|339|351|363|374|387|399|256|292|299|311|327|339|352|366|376|390|404|416' )
price02 = Price.create(widths:'60|70|80|90|100|110|120|130|140', heights:'65|75|85|95|105|115|125|135|145|155|165|175', prices:'329|334|347|354|363|374|383|||334|343|353|359|372|385|397|426||343|349|360|372|385|399|412|439|452|350|355|373|387|401|415|429|459|472|354|368|386|401|413|429|443|472|491|364|379|395|411|428|443|457|490|509|376|390|410|426|443|458|472|505|527|385|402|422|438|455|471|489|521|541|402|420|441|457|474|493|508|541|564|412|430|452|471|489|506|523|558|580|424|443|465|484|504|521|540|576|596|436|456|479|498|518|538|556|595|617' )

Mode.create(name: 'type1', code: 'type1', price: price01)
Mode.create(name: 'type2', code: 'type2', price: price02)

Carousel.create(target:'/configurator/pvc/neuf', src:'fenetre-pvc.png', alt_text: 'PVC/Aluminium', page:'index', order:0, is_active:true )
Carousel.create(target:'', src:'fenetre-aluminium.png', alt_text: 'Aluminium', page:'index', order:1)
Carousel.create(target:'', src:'Volets-roulants.png', alt_text: 'Volet roulants', page:'index', order:2)
Carousel.create(target:'', src:'store.png', alt_text: 'Store', page:'index', order:3)
Carousel.create(target:'', src:'rideaux.png', alt_text: 'Rideaux', page:'index', order:4)
Carousel.create(target:'', src:'Volet-battant.png', alt_text: 'Volet battant', page:'index', order:5)

# . . .