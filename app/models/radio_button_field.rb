class RadioButtonField < SurveyField
  has_many :radio_button_responses
  attr_accessible :radio_button_options
end
