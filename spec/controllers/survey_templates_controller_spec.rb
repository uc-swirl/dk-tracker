require 'spec_helper'


describe SurveyTemplatesController do
		describe "Displaying templates" do
		it 'Should render the SurveyTemplate#show' do
			st = SurveyTemplate.create
			get :show, :id => st.id
			expect(response).to render_template("show")	
		end
	end
end

