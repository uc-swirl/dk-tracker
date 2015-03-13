class SubmissionsController < ApplicationController
  def index
  end
  def new
  end
  def create
    s = Submission.create
    params[:submission].each do |submission|
      id = SurveyField.find_the_id(submission[0])
      response = FieldResponse.create(:response => submission[1])
      response.survey_field_id = id
      response.submission_id = s.id
      response.save!
    end
    flash[:notice] = "Your submission was recorded."
    redirect_to survey_templates_path
  end 
end
