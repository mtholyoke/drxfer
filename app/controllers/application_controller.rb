class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!
  protect_from_forgery

  def admin_required!
    (user_signed_in? && current_user.admin?) || non_admin_access_denied
  end

  def non_admin_access_denied
    logger.info "Non admin user access denied for #{current_user.username}"
    flash[:notice] = "Sorry, you have to be an admin to do that."
    if user_signed_in?
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :password)
    end
  end
end
