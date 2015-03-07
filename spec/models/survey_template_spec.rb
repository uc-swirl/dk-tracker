require 'spec_helper'

describe SurveyTemplate do
	it 'Should render the SurveyTemplate#show' do
		st = SurveyTemplate.create( )
		get :show, :id => st.id
		expect(response).to render_template("show")	
	end

end
