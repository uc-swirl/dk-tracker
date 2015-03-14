class PhoneField < SurveyField
  def is_valid?(response)
    seven = /^(?:\(?([0-9]{3})\)?[-. ]?)?([0-9]{3})[-. ]?([0-9]{4})$/
    one = /^(?:\+?1[-. ]?)?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
    ten = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/ 
    empty = /^$/
    output = {:value => true}
    if not (response =~ seven or response =~ one or response =~ ten or response =~ empty)
      output[:value] = false
      output[:survey_field] = :phone
      output[:message] = "is not a valid phone number"
    end
    output
  end
end
