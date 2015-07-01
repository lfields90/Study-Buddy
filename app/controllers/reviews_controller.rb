class ReviewsController < ApplicationController
  def new
    @spot = Spot.find params[:spot_id]
    @review = Review.new
  end

  def create
    @spot = Spot.find params[:spot_id]
    @review = Review.new(review_params)
    if @review.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :spot_id, :user_id)
  end
end
