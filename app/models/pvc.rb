class Pvc < ActiveRecord::Base
  has_one :product, as: :detail

  def title
    chassis
  end

  def to_s
    a_title = ["<tr>","<td> Matériel </td>"]
    a_title<< '<td>' + product.material + "</td>"
    a_title<<"</tr>"
    str_title = a_title.join(' ')

    a_type_de_pose = ["<tr>",'<td>Type de pose</td>']
    a_type_de_pose<< '<td>' + type_pose + "</td>"
    a_type_de_pose<< '</tr>'
    str_type_de_pose = a_type_de_pose.join(' ')

    a_coloris = ["<tr>",'<td>Coloris</td>']
    a_coloris<< '<td>' + product.color + ' | '
    a_coloris<< product.color_side + "</td>"
    a_coloris<<'</tr>'
    str_coloris = a_coloris.join(' ')

    a_type_de_chassis = ["<tr>",'<td>Type de chassis</td>']
    a_type_de_chassis<< '<td>' + chassis + ' | '
    a_type_de_chassis<<  ouverture + "</td>"
    a_type_de_chassis<< '</tr>'
    str_type_de_chassis = a_type_de_chassis.join(' ')

    a_options = ["<tr>",'<td>Options</td>']
    if chassis == 'Fenêtre'
      if traverse_intermediaire
        a_options<< '<td>Traverse intermédiaire</td>'
        a_options<< '</tr>'
      end
    else
      a_options << '<td>'
      a_options1 = []
      a_options1 << sens
      a_options1 << seuil_alu
      if sans_soubassement
        a_options1<< 'Sans soubassement'
      end
      if seurre
        a_options1<< 'Serrure'
      end
      if oscillo_battant
        a_options1<< 'Oscillo-battant'
      end
      if poignee_a_cle
        a_options1<< 'Poignée à clé'
      end
      if grill_aeration
        a_options1<< "Grille d'aération"
      end
      a_options << a_options1.join(' | ')
      a_options << '</td>'
    end
    a_options << '</tr>'
    str_options = a_options.join(' ')

    a_large = ["<tr>",'<td>Largeur totale en cm</td>']
    a_large<< '<td>' + product.width.to_s + "</td>"
    a_large<< '</tr>'
    str_large = a_large.join('')

    a_hauteur = ["<tr>",'<td>Hauteur totale en cm</td>']
    a_hauteur<< '<td>' + product.height.to_s + "</td>"
    a_hauteur<< '</tr>'
    str_hauteur = a_hauteur.join(' ')

    content = [str_title, str_type_de_pose, str_coloris, str_type_de_chassis, str_options, str_large, str_hauteur]
    return content.join()
  end
end
