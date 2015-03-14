class SubmissionsController < ApplicationController
  def index
  end
  def new
  end
  def create
    submission = Submission.create
    #arr = Array.new
    #@thing = "" 
    params[:submission].each_key do |key|
      field = SurveyField.find(key)
      answer = field.field_responses.build(:response => params[:submission][key])
      answer.save
      submission.field_responses << answer
      answer.save
      #@thing = @thing + " " + params[:submission][key].to_s + " " + params[:submission].to_s
    end
    flash[:notice] = "Your submission was recorded."
    redirect_to survey_templates_path
  end 
end

