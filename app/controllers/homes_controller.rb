class HomesController < ApplicationController
  def index
    if params[:search].present?
      redirect_to spots_path(search: params[:search])
      @spots = Spot.search(params[:search]).order("created_at DESC")
      @spots = @spots.page(params[:page])
    end
  end
end
