class EmailField < SurveyField
  def is_valid?(response)
  	output = {:value => true}
    if not EmailValidator.valid?(response)
      output[:value] = false
      output[:survey_field] = :email
      output[:message] = "is not valid email"
    end
    output
  end
end
