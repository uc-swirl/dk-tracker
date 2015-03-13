require 'spec_helper'

describe SurveyTemplate do
	#it 'Should render the SurveyTemplate#show' do
		#st = SurveyTemplate.create( )
		#get :show, :id => st.id
		#expect(response).to render_template("show")	
	#end
  
  it 'has access to its survey_fields' do 
    s = SurveyTemplate.create
    s.text_question_fields.build(:question_title => "Name:")
    s.text_question_fields.build(:question_title => "Phone:")
    s.text_question_fields.build(:question_title => "Address:")
    s.save
    s.survey_fields.length.should be 3
  end
end
