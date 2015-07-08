class SpotsController < ApplicationController
  def index
    if params[:search]
      @spots = Spot.search(params[:search]).order("created_at DESC")
      @spots = @spots.page(params[:page])
    else
      @spots = Spot.order("created_at DESC").page params[:page]
    end
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
    @reviews = @spot.reviews.order('created_at DESC').page(params[:page])
    if params[:search]
      redirect_to spots_path(search: params[:search])
      @spots = Spot.search(params[:search]).order("created_at DESC")
      @spots = @spots.page(params[:page])
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      flash[:success] = "Spot updated."
      redirect_to spot_path(@spot)
    else
      flash[:alert] = @spot.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    flash[:success] = "Spot destroyed"
    redirect_to spots_path
  end

  private

  def spot_params
    params.require(:spot).permit(
      :name, :description, :category, :address, :city, :state, :zip_code,
      :website_url, :photo_url, :phone
    )
  end
end
