class UsersController < ApplicationController
  def index
    if current_user.try(:admin?)
      @users = User.order('created_at DESC').page params[:page]
    else
      flash[:alert] = "Access denied! XD"
      redirect_to spots_path
    end
  end

  def destroy
    if current_user.try(:admin?)
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = "User deleted"
      redirect_to users_path
    end
  end
end
