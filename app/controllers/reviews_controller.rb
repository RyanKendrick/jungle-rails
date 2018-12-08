class ReviewsController < ApplicationController

  def create
    review = Review.new(
      product_id: params[:product_id],
      user_id: current_user[:id],
      description: params[:review][:description],
      rating: params[:review][:rating]
    )

    if review.save
      redirect_to product_path(:id => params[:product_id])
    else
      redirect_to product_path(:id => params[:product_id]), notice: 'NO DICE BRAH!'
    end
  end
end
