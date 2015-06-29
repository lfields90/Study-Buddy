class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      flash[:notice] = 'Spot added.'
      redirect_to spots_path
    else
      flash[:alert] = @spot.errors.full_messages
      render :new
    end
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :description, :category, :address, :city, :state, :zip_code, :website_url, :photo_url, :phone)
  end
end
