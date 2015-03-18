Feature: Survey creation
As a course instuctor or TA,
So that I can get feedback from students
I would like to make new course surveys

Scenario:
Given I am an instructor
And I make a new survey
Then I should be on the new/edit survey page

Scenario:
Given I am a TA
And I edit my instructor's survey
Then I should be on the new/edit survey page

Scenario:
Given I am a student
And I edit my instructor's survey
Then I should not be on the new/edit survey page
And I should see an error message

