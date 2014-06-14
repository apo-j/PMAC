class AddressController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user[:id]
    redirect_to '/preorder/payment'
=begin
    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Addresse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @address }
      else
        format.html { render action: 'new' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
=end

  end

  def destroy
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def address_params
    params.require(:address).permit(:name, :last_name, :postal ,:city, :telephone)
  end
end
