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
      flash[:notice] = "Review successfully added"
      redirect_to spot_path(@spot)
    else
      flash[:alert] = @review.errors.full_messages.join(".  ")
      render :new
    end
  end

  def upvote
    @review = Review.find(params[:id])
    @review.vote_count += 1
    @review.save
  end

  def downvote
    @review = Review.find(params[:id])
    @review.vote_count -= 1
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :spot_id, :user_id)
  end
end
