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
      flash[:success] = "Spot added."
      redirect_to spots_path
    else
      flash[:alert] = @spot.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = @spot.reviews
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    redirect_to spot_path(@spot)
  end

  private

  def spot_params
    params.require(:spot).permit(
      :name, :description, :category, :address, :city, :state, :zip_code,
      :website_url, :photo_url, :phone
    )
  end
end
