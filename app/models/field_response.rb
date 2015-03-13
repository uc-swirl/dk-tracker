class FieldResponse < ActiveRecord::Base
  attr_accessible :response
  belongs_to :survey_field
  belongs_to :submission

  validate :response_format

  def response_format
    response.survey_field.is_valid?(response.response)
    
  end
  
end
