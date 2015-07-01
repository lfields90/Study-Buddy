class ReviewsController < ApplicationController
  def new
    @spot = Spot.find params[:spot_id]
    @review = Review.new
    @ratings = [1, 2, 3, 4, 5]
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.spot_id = @spot.id
    if @review.save
      flash[:notice] = "Review sucessfully added"
      redirect_to spot_path(@spot)
    else
      flash[:error] = "Missing information"
      render :new
    end
  end

  protected

  def review_params
    params.require(:review).permit(:body, :rating, :spot_id, :user_id)
  end
end
