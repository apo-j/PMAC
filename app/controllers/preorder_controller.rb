class PreorderController < ApplicationController

  before_action :require_login, only: [:livraison, :payment, :confirmation]
  before_action :set_cart, only: [:livraison, :payment, :process_payment]

  def livraison
    @address = Address.where('user_id = ?', current_user[:id] ).first
    if(@address.nil?)
      @address = Address.new
    end
  end

  def recapitulatif
  end

  def payment
    if !address_params[:id].blank?
      @address = Address.find(address_params[:id])
    else
      @address = nil
    end
    if @address.nil?
      @address = Address.create(address_params)
      @user = User.find(current_user[:id])
      @user.addresses<<@address
      @user.save
    else
      @address.update(address_params)
    end
    gon.client_token = generate_client_token
  end

  def process_payment
    action_name = preorder_livraison_path
    @address = Address.where('user_id = ?', current_user[:id] ).first
    @order = Order.new
    @order.name= SecureRandom.uuid[0..7]
    @order.email= current_user[:login]
    @order.address=@address.address + ' '+@address.postal + ' '+@address.city
    @order.add_line_items_from_cart(@cart)
    if @order.save
      @result = Braintree::Transaction.sale(
          amount: @cart.total_price,
          payment_method_nonce: params[:payment_method_nonce])
      if @result.success?
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        action_name = preorder_confirmation_path
      else
        flash[:KO] = "Something went wrong while processing your transaction. Please try again!"
        gon.client_token = generate_client_token
      end
    else
      flash[:KO] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
    end
    redirect_to action_name
  end

  def confirmation
    @order = Order.where("email = ? and state = 'payed'", current_user[:login]).order(:id).reverse_order.first
  end


  private
  def generate_client_token
    Braintree::ClientToken.generate
  end

  def address_params
    params.require(:address).permit(:id, :name, :last_name, :postal,:address, :city, :telephone)
  end

end
