class OrdersController < ApplicationController
  include CurrentCart
  before_action :require_login, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :require_admin, only: [:next_step, :go_back, :cancel, :search]
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token, :only => [:next_step, :go_back, :cancel]
  # GET /orders
  # GET /orders.json
  def index
    if current_user[:user_type] == :normal
      @orders = Order.where('email = ?', current_user[:login]).order(:created_at).reverse_order
    else
      @orders = Order.order(:created_at).reverse_order
    end
    @criteria = OrderCriteria.new
  end

  def search
    name = criteria_params[:name]
    state = criteria_params[:state]
    start_date = criteria_params[:start_date]
    end_date = criteria_params[:end_date]
    sql = []
    unless name.blank?
      sql << "name = '"+name + "'"
    end

    unless state.blank?
      sql << "state = '"+state + "'"
    end

    unless start_date.blank?
      start_date = DateTime.strptime(start_date, '%d/%m/%Y')
      sql << "created_at >= STR_TO_DATE('" + start_date.to_s + "','%Y/%m/%d')"
    end

    unless end_date.blank?
      start_date = DateTime.strptime(end_date, '%d/%m/%Y')
      sql << "created_at <= STR_TO_DATE('" + end_date.to_s + "','%Y/%m/%d')"
    end
    @orders = Order.where(sql.join(' and ')).order(:created_at).reverse_order
    @criteria = OrderCriteria.new(criteria_params)
    render "index"
  end



  def next_step
    @order = Order.find(params[:id])
    @order.next_step
    res = {}
    res[:id] = @order.id
    res[:state] = @order.state
    res[:state_value] = @order.state_value
    return render :json => res
  end

  def go_back
    @order = Order.find(params[:id])
    @order.go_back
    res = {}
    res[:id] = @order.id
    res[:state] = @order.state
    res[:state_value] = @order.state_value
    return render :json => res
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel
    res = {}
    res[:id] = @order.id
    res[:state] = @order.state
    res[:state_value] = @order.state_value
    return render :json => res
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    get_livraison_and_facturation
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
      redirect_to root_path, notice: "Votre panier est vide"
      return
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        redirect_to preorder_confirmation_path
=begin
        format.html { redirect_to root_path, notice: 'Thank you for your order.' }
        format.json { render action: 'show', status: :created, location: @order }
=end
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id, :name, :address, :email, :pay_type)
    end

    def criteria_params
      params.require(:order_criteria)
    end

  def get_livraison_and_facturation
    @user = User.find_by(login: @order.email)
    @livraison = Address.where('user_id = ? and address_type = ?', @user.id, 1 ).first
    @facturation = Address.where('user_id = ? and address_type = ?', @user.id, 2 ).first
    if @livraison.nil?
      @livraison = Address.new(Address_type:1)
    end

    if @facturation.nil?
      @facturation = @livraison
    end

  end

end
