class PreorderController < ApplicationController
  def livraison
    @address = Address.find_by_user_id(current_user[:id])
    if(@address.nil?)
      @address = Address.new
    end
  end

  def recapitulatif
  end

  def payment
  end

  def confirmation
  end
end