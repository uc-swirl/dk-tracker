class DashboardController < ApplicationController
    before_filter :authorize, :except => [:login]

    def authorize
      if not(current_user)
        redirect_to dashboard_login_path
      end
    end

    def add_user

    end

    def update_permissions
      permissions = params[:permissions]
      x = permissions
      y = permissions[:status]
      z = params[:permissions][:status]

      user = User.where(email: permissions[:email]).first
      if not user
        flash[:notice] = "Update unsuccessful"
        return redirect_to admin_add_user_path
      end
      # just giving generalized admin permissions for now
      if permissions[:status] == "student"
        user.admin = false
      else
        user.admin = true
      end
      user.save!
      
      flash[:notice] = "Successfully updated user permissions to " + permissions[:status]
        
      return redirect_to admin_add_user_path
    end

    def index

    end

    def login
      render :action => "login", :layout => "admin_login"
    end
end
