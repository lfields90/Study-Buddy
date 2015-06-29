class SpotsController < ApplicationController
  def index
    @spots = Spots.all
  end
end
