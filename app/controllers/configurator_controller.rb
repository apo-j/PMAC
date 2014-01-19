class ConfiguratorController < ApplicationController
  before_action :verify_params, only: ['index']
  protect_from_forgery except: :price_data
  def index
    @response = {}
    @response[:data] = {}

    begin
      @response[:data]['matiere'] = Material.all
      @response[:data]['coloris'] = Color.all
      @response[:data]['type'] = Mode.all
      @response[:data]['dimension'] = {width: {value:0, range: {left: 50, right:160}}, height:{value:0, range:{left:45, right:95}} }
      @response[:data]['is_neuf'] = params[:type].to_s.upcase == 'NEUF' ? true : false

      @response[:status] = 200
    rescue SYS::ObjNotValid
      @response[:status] = 'not valide'
    rescue SYS::FieldNotValid
      @response[:status] = 'not valide2'
    rescue StandardError
      @response[:status] = 'not valide3'
    end
  end


  def price_data
    matiere = params[:matiere]
    type =  params[:type]

    mode = Mode.find(type)
    prices_data = mode.price

    res = {}
    res[:widths] =  prices_data[:widths]
    res[:heights] =  prices_data[:heights]
    #res[:options] =  matrix_price:options]
    res[:data] =  prices_data[:prices]
    return render :json => res
  end

  private
    def verify_params
      if(!params[:material] || params[:material] == '')
        logger.error "Attempt to access invalid address /configurator/#{params[:meterial]}/#{params[:type]}"
        redirect_to store_url, notice: 'Paramères non valides'
      end
    end
end
