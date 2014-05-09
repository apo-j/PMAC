class StoreController < ApplicationController
  def index
    #@products = Product.order(:title)
    @carousel = Carousel.where("page=?", 'index').order(:order)
  end
end
