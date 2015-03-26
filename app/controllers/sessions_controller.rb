class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    #if session[:template_id]
    #  template = SurveyTemplate.find(session[:template_id])
    #  flash[:notice] = template.id
    #  redirect_to :survey_templates
    #else
    redirect_to :dashboard
    #end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :dashboard_login
  end
end
