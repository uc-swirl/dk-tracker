class SurveyTemplatesController < ApplicationController
  def index
    @templates = SurveyTemplate.all
  end
  def show # shows the HTML form
    @fields = SurveyTemplate.find(params[:id]).survey_fields    
  end

end

