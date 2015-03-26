require 'spec_helper'

describe SubmissionsController do
  before(:each) do
    @user = User.create()
    session[:user_id] = @user.id     
  end
  it 'adds a submission to the submissions table' do
    st = SurveyTemplate.create
    f1 = st.text_question_fields.build(:question_title => "Poodles?") 
    st.save!   
    expect{
      post :create, {:submission => {f1.id => "another response"}, :template_id => st.id}
    }.to change{Submission.all.length}.by(1)
  end
  
  it 'adds responses to the field_responses table'do
    st = SurveyTemplate.create
    f1 = st.text_question_fields.build(:question_title => "PoOdles?") 
    f2 = st.text_question_fields.build(:question_title => "TOodles!") 
    st.save! 

    expect{
      post :create, {:submission => { f1.id => "another response", f2.id => "another response"}, :template_id => st.id}
    }.to change{FieldResponse.all.length}.by(2)
  end
  
  it 'goes back to the survey templates page' do
    st = SurveyTemplate.create
    f1 = st.text_question_fields.build(:question_title => "Poodles?") 
    st.save!   
    post :create, {:submission => {f1.id => "another response"}, :template_id => st.id}
    response.should redirect_to survey_templates_path
  end
end
