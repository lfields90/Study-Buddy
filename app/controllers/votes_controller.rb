class VotesController < ApplicationController
  def create
    @vote = Vote.new(data_params)
    if @vote.save
      render json: {statusText: "We Won!"}
    else
      render json: {statusText: "Boooo!"}
    end
  end

  def destroy
    @vote = Vote.where(review_id: params[:id], user_id: current_user)
    @vote.each do |vote|
      demo = vote.vote_value
      if vote.destroy
        render json: {statusText: "#{demo}"}
      else
        render json: {statusText: "Boooo!"}
      end
    end
  end

  private

  def data_params
     params.require(:vote).permit(:review_id, :user_id, :spot_id, :vote_value)
  end
end
