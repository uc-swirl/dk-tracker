class Submission < ActiveRecord::Base
  belongs_to :survey_template
  has_many :field_responses
end
