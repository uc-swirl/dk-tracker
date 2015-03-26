class StudentController < ApplicationController

	def login
	  render :action => "login", :layout => "volunteer_login"
	end

end