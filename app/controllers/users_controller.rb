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

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if (current_user && current_user.id == @user.id) ||
        (current_user && current_user.admin?)
      if @user.update(user_params)
        flash[:success] = "Profile updated."
        redirect_to user_path(@user)
      else
        flash[:alert] = @user.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that user."
      redirect_to spots_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email)
  end
end
