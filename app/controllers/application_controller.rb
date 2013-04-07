class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def authenticate_admin_user!
    authenticate_user!
    authorize! :manage, :all
  end

end
