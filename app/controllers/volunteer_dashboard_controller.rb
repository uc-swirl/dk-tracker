class VolunteerDashboardController < ApplicationController
    before_filter :authorize, :except => [:login]
    def authorize
      if not(user_signed_in?)
        redirect_to new_user_session_path
      end
    end

    def index
      @templates = current_user.surveyTemplates
    end

    def login
      render :action => "login", :layout => "volunteer_login"
    end
end
