class SubmissionsController < ApplicationController
  def index
  end
  def new
  end
  def create
    submission = Submission.create
    #arr = Array.new
    params[:submission].each_key do |key|
      field = SurveyField.find(key)
      answer = field.field_responses.build(:response => params[:submission][key])
      #arr << value
      #submission.field_responses << response
      answer.save
    end
    flash[:notice] = "Your submission was recorded."
    redirect_to survey_templates_path
  end 
end

