class FieldResponse < ActiveRecord::Base
  attr_accessible :response
  belongs_to :survey_field
  belongs_to :submission
  
end