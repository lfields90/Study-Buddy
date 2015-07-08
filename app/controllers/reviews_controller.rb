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
    if current_user.try(:admin?)
      @review.destroy
      flash[:notice] = "Review destroyed"
      redirect_to spots_path(@spot)
    else
      flash[:notice] = "You don't have permission to destroy that review."
      redirect_to spot_path(@spot)
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :spot_id, :user_id)
  end
end
