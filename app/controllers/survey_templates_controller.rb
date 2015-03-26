class SurveyTemplatesController < ApplicationController
  #before_filter :loggedin, :only => :show

  def loggedin
  	if not session[:user_id]
  		params[:template_id] = params[:id]
  		redirect_to student_login_path
  	end

  end

  def index
    @templates = SurveyTemplate.all
  end
  def show # shows the HTML form
    @fields = SurveyTemplate.find(params[:id]).survey_fields
    @id = params[:id]
  end

end

