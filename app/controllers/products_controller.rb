class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  # def create_review
  #   review = Review.new({
  #     product_id: ,
  #     user_id: ,
  #     description: ,
  #     rating:
  #
  #   })
  # end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews
    @review = Review.new
  end

end
