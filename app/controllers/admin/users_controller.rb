class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @users = User.page params[:page]
  end

  def destroy
    @user.destroy
    flash[:success] = t :destroy_success
    redirect_to admin_users_path
  end
end
