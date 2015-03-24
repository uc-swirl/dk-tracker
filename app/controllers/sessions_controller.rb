class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to :dashboard
  end

  def destroy
    session[:user_id] = nil
    redirect_to :dashboard_login
  end
end
