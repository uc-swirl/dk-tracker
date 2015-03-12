class SurveyTemplatesController < ApplicationController
	def index
		#@stemplates = SurveyTemplate.survey_fields
		@stemplates = [1,2,3,4]
	end

	def show
		id = params[:id]
		#@stemplates = SurveyTemplate.find(id).survey_fields
		@stemplates = [1,2,3,4]
	end
end
