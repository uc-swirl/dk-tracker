Given /I make a survey template$/ do
  @template = SurveyTemplate.create
  @question_number = 0
end

And /I add an EmailField to that template with question "(.*?)"/ do |question|
  field = @template.email_fields.create!(:question_title => question)
end
And /I add a TextQuestionField to that template with question "(.*?)"/ do |question|
  field = @template.text_question_fields.create!(:question_title => question)
end
And /I add a CheckboxField to that template with question "(.*?)"/ do |question|
  field = @template.checkbox_fields.create!(:question_title => question)
end

And /I add a PhoneField to that template with question "(.*?)"/ do |question|
  field = @template.phone_fields.create!(:question_title => question)
end

And /I add a RadioButtonField to that template with question "(.*?)"/ do |question|
  field = @template.radio_button_fields.create!(:question_title => question)
end

And /I add a DropDownField to that template with question "(.*?)"/ do |question|
  field = @template.drop_down_fields.create!(:question_title => question)
end

Given /I visit that survey's page/ do
  visit survey_template_path(@template.id)
end


And /I fill in the (?:first|next) field with "(.+)"/ do |value|
  fill_in("submission_" + @template.survey_fields[@question_number].id.to_s, :with =>value)
  @question_number += 1
end

Given(/^I press submit$/) do
  click_button("survey_submit")
end






