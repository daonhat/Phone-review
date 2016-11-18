class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  before_filter :set_search

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for resource
    current_user.try(:is_admin?) ? admin_root_path : root_path
  end

  def set_search
    @search = Phone.search params[:q]
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :avatar, :phone_number, :address,
      :dob, :gender, :work, :password, :current_password) }
  end

  private
  def verify_admin
    redirect_to root_url unless current_user.try :is_admin?
  end
end
