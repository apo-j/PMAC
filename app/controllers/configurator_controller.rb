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

  def indexAlu
    @response = {}
    @response[:data] = {}

    begin
      @response[:status] = 200
    rescue SYS::ObjNotValid
      @response[:status] = 'not valide'
    rescue SYS::FieldNotValid
      @response[:status] = 'not valide2'
    rescue StandardError
      @response[:status] = 'not valide3'
    end
  end

  def indexStore
    @response = {}
    @response[:data] = {}

    begin
      @response[:status] = 200
    rescue SYS::ObjNotValid
      @response[:status] = 'not valide'
    rescue SYS::FieldNotValid
      @response[:status] = 'not valide2'
    rescue StandardError
      @response[:status] = 'not valide3'
    end
  end

  def indexRideaux
    @response = {}
    @response[:data] = {}

    begin
      @response[:status] = 200
    rescue SYS::ObjNotValid
      @response[:status] = 'not valide'
    rescue SYS::FieldNotValid
      @response[:status] = 'not valide2'
    rescue StandardError
      @response[:status] = 'not valide3'
    end
  end

  def indexVoletRoulant
    @response = {}
    @response[:data] = {}

    begin
      @response[:status] = 200
    rescue SYS::ObjNotValid
      @response[:status] = 'not valide'
    rescue SYS::FieldNotValid
      @response[:status] = 'not valide2'
    rescue StandardError
      @response[:status] = 'not valide3'
    end
  end

  def indexAccessoires
    @response = {}
    @response[:data] = {}

    begin
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
=begin
    matiere = params[:matiere]
    type =  params[:type]

    mode = Mode.find(type)
    prices_data = mode.price

    res = {}
    res[:widths] =  prices_data[:widths]
    res[:heights] =  prices_data[:heights]
    #res[:options] =  matrix_price:options]
    res[:data] =  prices_data[:prices]
=end
    res = {}
    res[:widths] =  '50|60|70|80|90|100|110|120|130|140|150|160'
    res[:heights] =  '45|55|65|75|85|95'
    res[:data] =  '220|257|263|268|279|285|294|300|305|313|321|329|225|262|267|276|284|292|299|304|313|322|331|340|232|267|276|282|291|299|307|318|329|339|349|359|238|276|281|289|298|309|320|331|341|353|366|378|249|285|292|300|315|328|339|351|363|374|387|399|256|292|299|311|327|339|352|366|376|390|404|416'
    return render :json => res
  end

  private
    def verify_params
=begin
      if(!params[:material] || params[:material] == '')
        logger.error "Attempt to access invalid address /configurator/#{params[:meterial]}/#{params[:type]}"
        redirect_to store_url, notice: 'Paramères non valides'
      end
=end
    end
end
