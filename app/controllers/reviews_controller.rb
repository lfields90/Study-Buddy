class ReviewsController < ApplicationController
  def new
    @spot = Spot.find params[:spot_id]
    @review = Review.new
    @ratings = [1,2,3,4,5]
  end

  def create
    session[:user_id] ||= "1"
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    @review.spot_id = @spot.id
    if @review.save
      flash[:notice] = "Review sucessfully added"
      redirect_to spot_path(@spot)
    else
      flash[:notice] = "Review needs to be complete"
      render :new
    end
  end

  protected

  def review_params
    params.require(:review).permit(:body, :rating, :spot_id, :user_id)
  end
end
