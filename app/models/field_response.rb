class FieldResponse < ActiveRecord::Base
  attr_accessible :response
  belongs_to :survey_field
  belongs_to :submission

  validate :response_format

  def response_format
  	valid_output = self.survey_field.is_valid?(self.response)
    if not valid_output[:value]
      errors.add(valid_output[:survey_field], valid_output[:message])
    end
  end
end
