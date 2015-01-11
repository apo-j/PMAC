class Pvc < ActiveRecord::Base
  has_one :product, as: :detail

  def title
    chassis
  end

  def to_s
    a_title = []
    a_title<<product.material
    a_title<< '<br>'
    str_title = a_title.join(' ')
    a_type_de_pose = ['Type de pose :']
    a_type_de_pose<<type_pose
    a_type_de_pose<< '<br>'
    str_type_de_pose = a_type_de_pose.join(' ')
    a_coloris = ['Coloris :']
    a_coloris<<product.color
    a_coloris<<product.color_side
    a_coloris<<'<br>'
    str_coloris = a_coloris.join(' ')
    a_type_de_chassis = ['Type de chassis :']
    a_type_de_chassis<<chassis
    a_type_de_chassis<<ouverture
    a_type_de_chassis<< '<br>'
    str_type_de_chassis = a_type_de_chassis.join(' ')
    a_options = []
    if chassis == 'Fenêtre'
      if traverse_intermediaire
        a_options<< 'Options :'
        a_options<< 'Traverse intermédiaire'
        a_options<< '<br>'
      end
    else
      a_options<< 'Options : '
      a_options<< 'sens ' + sens
      a_options<< seuil_alu
      if sans_soubassement
        a_options<< 'Sans soubassement'
      end
      if seurre
        a_options<< 'Serrure'
      end
      if oscillo_battant
        a_options<< 'Oscillo-battant'
      end
      if poignee_a_cle
        a_options<< 'Poignée à clé'
      end
      if grill_aeration
        a_options<< "Grille d'aération"
      end
      a_options<< '<br>'
    end
    str_options = a_options.join(' ')
    a_large = ['Largeur totale en cm :']
    a_large<<product.width
    a_large<< '<br>'
    str_large = a_large.join('')
    a_hauteur = ['Hauteur totale en cm :']
    a_hauteur<<product.height
    a_hauteur<< '<br>'
    str_hauteur = a_hauteur.join(' ')
    content = [str_title, str_type_de_pose, str_coloris, str_type_de_chassis, str_options, str_large, str_hauteur]
    return content.join()
  end
end
