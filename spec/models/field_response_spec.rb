require 'spec_helper'

describe FieldResponse do
  it "should create a FieldResponse for a valid email response" do
    survey = SurveyTemplate.create
    field = survey.email_fields.build(:question_title => "Email:")
    submis = survey.submissions.build()
    response = field.field_responses.build(:response => "saasbook@saasbook.com")
    submis.field_responses << response
    submis.save
    submis.field_responses.where(survey_field_id: field.id).first.response.should eq "saasbook@saasbook.com"
  end
  it "should not create a FieldResponse if given an invalid email response" do
  	survey = SurveyTemplate.create
    field = survey.email_fields.build(:question_title => "Email:")
    submis = survey.submissions.build()
    response = field.field_responses.build(:response => "saasbook")
    submis.field_responses << response
    submis.save
    submis.field_responses.should be [] #be_empty
  end
  it "should create a FieldResponse for a valid phone number response" do
    survey = SurveyTemplate.create
    field = survey.phone_fields.build(:question_title => "Phone Number:")
    submis = survey.submissions.build()
    response = field.field_responses.build(:response => "1234567890")
    submis.field_responses << response
    submis.save
    submis.field_responses.where(survey_field_id: field.id).first.response.should eq "1234567890"
  end
  it "should not create a FieldResponse if given an invalid phone number response" do
  	survey = SurveyTemplate.create
    field = survey.email_fields.build(:question_title => "Phone Number:")
    submis = survey.submissions.build()
    response = field.field_responses.build(:response => "saasbook")
    submis.field_responses << response
    submis.save
    submis.field_responses.should be_empty
  end
  it "should create a FieldResponse for a valid text question response" do
    survey = SurveyTemplate.create
    field = survey.text_question_fields.build(:question_title => "Do you like ponies:")
    submis = survey.submissions.build()
    response = field.field_responses.build(:response => "frootloops")
    submis.field_responses << response
    submis.save
    submis.field_responses.where(survey_field_id: field.id).first.response.should eq "frootloops"
  end
end
