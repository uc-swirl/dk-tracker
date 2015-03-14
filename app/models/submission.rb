class Submission < ActiveRecord::Base
  has_many :field_responses
  belongs_to :survey_template
end
