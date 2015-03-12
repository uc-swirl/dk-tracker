class SurveyTemplate < ActiveRecord::Base
  #has_many :survey_fields
  has_many :name_fields
  has_many :checkbox_fields
  has_many :phone_fields
  has_many :drop_down_fields
  has_many :text_question_fields
  has_many :radio_button_fields
  has_many :email_fields
end
