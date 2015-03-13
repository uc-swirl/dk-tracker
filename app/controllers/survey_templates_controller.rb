class SurveyTemplatesController < ApplicationController
	def index
		if !(user_signed_in?)
			redirect_to new_user_session_path
		end
	end

	def show

	end

	def new

	end

	def create
		#SurveyTemplate.create!(params[:survey_template])
		flash[:notice] = "Form was successfully submitted."
		redirect_to survey_templates_path
	end
end

