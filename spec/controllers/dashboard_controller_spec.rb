require 'spec_helper'

describe DashboardController do


    describe "Render the appropriate layouts and templates" do
      before(:each) do
        @request.env["devise.mapping"] = :user
        @user = Factory(:user)
        sign_in @user
      end
    it 'Indes should render the dashboard layout' do
      get :admin
      response.should render_template("layouts/dashboard")
    end
  end

end
