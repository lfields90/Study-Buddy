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
      flash[:success] = "Review successfully added"
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
    if @review.save
      render json: {status: "good"}
    else
      render json: {status: "bad"}
    end
  end

  def downvote
    @review = Review.find(params[:id])
    @review.vote_count -= 1
    if @review.save
      render json: {status: "good"}
    else
      render json: {status: "bad"}
    end
  end

  def edit
    @spot = Spot.find params[:spot_id]
    @review = Review.find(params[:id])
    @ratings = [1, 2, 3, 4, 5]
  end

  def update
    @spot = Spot.find params[:spot_id]
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "Review successfully updated"
      redirect_to spot_path(@spot)
    else
      flash[:alert] = @review.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review destroyed"
    redirect_to spots_path(@spot)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :spot_id, :user_id)
  end
end
