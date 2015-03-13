require 'spec_helper'

describe SubmissionsController do
  it 'adds a submission to the submissions table' do
    SurveyField.stub(:find_the_id).and_return(1)
    expect{
      post :create, {:submission => [[1, "response"], [2,"another response"]]}
    }.to change{Submission.all.length}.by(1)
  end
  
  it 'adds responses to the field_responses table'do
    SurveyField.stub(:find_the_id).and_return(1)
    
    expect{
      post :create, {:submission => [[1, "response"], [2,"another response"]]}
    }.to change{FieldResponse.all.length}.by(2)
  end
  
  it 'goes back to the survey templates page' do
    SurveyField.stub(:find_the_id).and_return(1)
    post :create, {:submission => [[1, "response"], [2,"another response"]]}
    response.should redirect_to survey_templates_path
  end
end
