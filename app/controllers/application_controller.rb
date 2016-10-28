class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protect_from_forgery with: :exception

  def after_sign_in_path_for resource
    current_user.try(:is_admin?) ? admin_root_path : root_path
  end

  private
  def verify_admin
    redirect_to root_url unless current_user.try :is_admin?
  end
end
