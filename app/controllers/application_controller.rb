class ApplicationController < ActionController::Base
  protect_from_forgery


def after_sign_in_path_for(resource)
  if current_user.try(:admin?)
    dashboard_path
  else
    volunteer_path
  end
end

end
