class PhoneField < SurveyField
  def is_valid?(response)
    seven = /^(?:\(?([0-9]{3})\)?[-. ]?)?([0-9]{3})[-. ]?([0-9]{4})$/
    one = /^(?:\+?1[-. ]?)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
    ten = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/ 
    empty = /^$/
    if not (response =~ seven or response =~ one or response =~ ten or response =~ empty)
      errors.add(:phone, "is not a valid phone number")
    end
  end
end
