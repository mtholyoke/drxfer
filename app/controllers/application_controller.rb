class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery
  
  before_action :authenticate_user!

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
end
