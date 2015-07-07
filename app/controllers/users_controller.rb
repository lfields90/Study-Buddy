class UsersController < ApplicationController
  def index
    if current_user.try(:admin?)
    @users = User.order('created_at DESC').page params[:page]
    else
      flash[:notice] = "Access denied! XD"
      redirect_to root_path
    end
  end
end
