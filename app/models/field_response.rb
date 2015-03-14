class FieldResponse < ActiveRecord::Base
  attr_accessible :response
  belongs_to :survey_field
  belongs_to :submission

  validate :response_format

  def response_format
    self.survey_field.is_valid?(self.response)
    
  end
  
end
