class Admin::UsersController < Admin::BaseController
	load_and_authorize_resource

	def new
	end

	def create
		@user.password = @user.email
		if @user.save
			redirect_to admin_users_path
		else
			render :new
		end
	end

	def edit

	end

	def update
		if @user.update_attributes user_params
			flash[:success] = t :profile_updated
			redirect_to admin_users_path
		else
			render :edit
		end
	end

	def index
		@search = User.search params[:q]
		@users = @search.result.page params[:page]
		# byebug
	end

	def destroy
		@user.destroy
		flash[:success] = t :destroy_success
		redirect_to admin_users_path
	end

	private
	def user_params
		params.require(:user).permit :name, :avatar, :email
	end
end
