require 'spec_helper'

describe FieldResponse do
  it "should create a FieldResponse for a valid email response" do
    survey = SurveyTemplate.create
    field = EmailField.create(:question_title => "Email:")
    survey.survey_fields << field
    submis = survey.submissions.build
    response = field.field_responses.build(:response => "saasbook@saasbook.com")
    submis.field_responses << response
    submis.save
    Submission.find(submis.id).field_responses.where(survey_field_id: field.id).first.response.should eq "saasbook@saasbook.com"
  end
  it "should not create a FieldResponse if given an invalid email response" do
  	survey = SurveyTemplate.create
    field = EmailField.create(:question_title => "Email2:")
    survey.survey_fields << field
    submis = survey.submissions.build()
    submis.save
    response = field.field_responses.build(:response => "saasbook")
    submis.field_responses << response
    expect {response.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Email is not valid email')
  end
  it "should create a FieldResponse for a valid phone number response" do
    survey = SurveyTemplate.create
    field = PhoneField.create(:question_title => "Phone Number:")
    survey.survey_fields << field
    submis = survey.submissions.build()
    response = field.field_responses.build(:response => "1234567890")
    submis.field_responses << response
    submis.save
    Submission.find(submis.id).field_responses.where(survey_field_id: field.id).first.response.should eq "1234567890"
  end
  it "should not create a FieldResponse if given an invalid phone number response" do
  	survey = SurveyTemplate.create
    field = PhoneField.create(:question_title => "Phone Number2:")
    survey.survey_fields << field
    submis = survey.submissions.build()
    submis.save
    response = field.field_responses.build(:response => "saasbook")
    submis.field_responses << response
    expect {response.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Phone is not a valid phone number')
  end
  it "should create a FieldResponse for a valid text question response" do
    survey = SurveyTemplate.create
    field = TextQuestionField.create(:question_title => "Do you like ponies:")
    survey.survey_fields << field
    submis = survey.submissions.build()
    response = field.field_responses.build(:response => "frootloops")
    submis.field_responses << response
    submis.save
    Submission.find(submis.id).field_responses.where(survey_field_id: field.id).first.response.should eq "frootloops"
  end
end
