Feature: publish a survey

As an instructor
In order to allow students to fill out the survey
I would like to make a survey live and visible to students

Scenario:
Given I am an instructor
And I have created a survey
When I press submit
Then the survey should be live

Scenario:
Given I am a student
And a survey is not published yet
When I go to that survey's page
Then I should see an error message

Scenario:
Given I am a student
And a survey is published
When I go to that survey's page
Then I should see the survey title
