class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_user, only: [:edit]
  load_and_authorize_resource

  def edit

  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t :profile_updated
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :avatar, :phone_number
  end

  def find_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      redirect_to root_path
      flash[:danger] = t :user_fails
    end
  end
end
