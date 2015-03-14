class DashboardController < ApplicationController
    before_filter :authorize, :except => [:login]
    def authorize
      if not(current_user.try(:admin?))
        redirect_to new_user_session_path
      end
    end

    def index
    end

    def login
      render :action => "login", :layout => "admin_login"
    end
end
