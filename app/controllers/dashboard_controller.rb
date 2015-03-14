class DashboardController < ApplicationController
    before_filter :authorize, :except => [:login]
    def authorize
      if not(current_user.try(:admin?))
        redirect_to new_user_session_path
      end
    end

    def add_user

    end

    def create_user
      user = params[:user]

      created = User.create(:firstname => user[:firstname],
         :lastname => user[:lastname], 
         :email => user[:email], 
         :password => user[:password],
         :password_confirmation=> user[:password_confirmation],
         :admin=> user[:admin] == "1"

         )
      if created.valid?
        flash[:notice] = "Succesfully added user"
        return redirect_to dashboard_path
      else
        flash[:notice] = "Invalid field"
        return redirect_to admin_add_user_path
      end
    end

    def index
    end

    def login
      render :action => "login", :layout => "admin_login"
    end
end
