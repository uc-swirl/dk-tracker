class EmailField < SurveyField
  def is_valid?(response)
    if not EmailValidator.valid?(response)
      errors.add(:email, "is not a valid email")
    end
  end
end