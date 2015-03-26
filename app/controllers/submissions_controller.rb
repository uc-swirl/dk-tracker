class SubmissionsController < ApplicationController
  def index
  end
  def new
  end
  def create
    template = SurveyTemplate.find(params[:template_id])
    user = User.find(session[:user_id])
    template.student_responses.build(:email => user.email)
    template.save


    begin
      #template = Template.find(params[:template_id])
      submission = template.submissions.create!
      params[:submission].each_key do |key|
        field = SurveyField.find(key)
        answer = field.field_responses.build(:response => params[:submission][key])
        answer.save!
        submission.field_responses << answer
        answer.save!
      end
      flash[:notice] = "Your submission was recorded."
      redirect_to survey_templates_path
    rescue Exception => e
      flash[:notice] = e.message
      redirect_to survey_template_path(template.id)
    end

  end 
end


