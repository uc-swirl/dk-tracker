class SurveyField < ActiveRecord::Base
  attr_accessible :question_title
  belongs_to :survey_template
  has_many :field_responses
  
  def self.find_the_id (question_title)
    SurveyField.where(:question_title => question_title).first.id
  end
end
