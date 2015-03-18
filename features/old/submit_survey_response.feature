Feature: Submit a survey response

As a student
So that I can give my feedback to professors
I would like to be able to fill out course surveys

Scenario:
Given I am a student
Then I should see a list of my instructors' surveys

Scenario:
Given I am a student
And I go to "Professor Fox's course eval"
And I fill in and submit the form
Then there should be a new response for that form
And my name should be among the respondees for that form
