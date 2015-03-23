class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def after_sign_in_path_for(resource)
    if @current_user.admin?
      dashboard_path
    else
      volunteer_path
    end
  end

end
