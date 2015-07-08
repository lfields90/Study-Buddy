class UsersController < ApplicationController
  def index
    if current_user.try(:admin?)
    @users = User.order('created_at DESC').page params[:page]
    else
      flash[:notice] = "Access denied! XD"
      redirect_to root_path
    end
  end

  def destroy
    if current_user.try(:admin?)
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = "User destroyed"
      redirect_to users_path
    end
  end
end
