require 'spec_helper'

describe DashboardController do
    describe "Render the appropriate layouts and templates when logged in" do
      before(:each) do
        OmniAuth.config.test_mode = true
        
      end
      it 'Index should render the dashboard layout' do
      get :index
      response.should render_template("layouts/dashboard")
    end
  end

    describe "Should not render admin layout, when not logged in" do
      before(:each) do
        OmniAuth.config.test_mode = true 
      end
      it 'Index should not render the dashboard layout' do
      get :index
      response.should_not render_template("layouts/dashboard")
    end
  end

end
