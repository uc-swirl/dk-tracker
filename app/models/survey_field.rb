class SurveyField < ActiveRecord::Base
  attr_accessible :question_title
  belongs_to :survey_template
  has_many :field_responses
  def is_valid?
    true
  end
end
