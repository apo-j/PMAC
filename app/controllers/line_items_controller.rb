class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  before_action :set_cart, only: [:create]
  protect_from_forgery except: :create
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product_info = params[:product_info]
    result = false
    ActiveRecord::Base.transaction do
      case product_info[:matiere]
        when 'pvc'
          @detail = Pvc.create!(type_pose: product_info[:typeRepose], chassis: product_info[:typeChassis], ouverture: product_info[:typeOuverture], sens: product_info[:sens], seuil_alu: product_info[:seuilAlu],
                            sans_soubassement: product_info[:options][:sansSoubassement].to_bool, seurre: product_info[:options][:serrure].to_bool, oscillo_battant: product_info[:options][:oscilloBattant].to_bool, poignee_a_cle: product_info[:options][:PoigneACle].to_bool,
                            grill_aeration: product_info[:options][:grilleAeration].to_bool, traverse_intermediaire: product_info[:options][:traverseIntermediaire].to_bool )
        when 'aluminium'
          @detail =  Alumium.create!()
        when 'store'
          @detail = Store.create!()
        when 'vr'
          @detail = VoletRouland.create!()
        when 'rideaux'
          @detail = RideauxMetalique.create!()
      end

      material = product_info[:matiere]
      color = product_info[:coloris]
      color_side = product_info[:colorisSide]
      width = product_info[:width].to_i
      height = product_info[:height].to_i
      price = product_info[:total].to_f
      title = [material, @detail.title].join(' ')
      @product = @detail.build_product(title: title, material: material, color: color, color_side: color_side, width: width, height: height, price: price)
      @product.save!
      @line_item = @cart.add_product(@product.id)
      @line_item.save!
      result = true
    end
    respond_to do |format|
      if result
        format.html { redirect_to store_url }
        format.js  { @current_item = @line_item }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
=begin
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
=end
end
