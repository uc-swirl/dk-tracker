class VolunteerDashboardController < ApplicationController
    before_filter :authorize, :except => [:login]
    def authorize
      if not(current_user)
        redirect_to volunteer_login_path
      end
    end

    def index
      @templates = current_user.surveyTemplates
    end

    def login
      render :action => "login", :layout => "volunteer_login"
    end
end
