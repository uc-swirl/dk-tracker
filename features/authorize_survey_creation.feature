Feature: Authorizing form creation

As an admin, 
So that non-instructors can't create course surveys
I want to be able to add list of authorized instructors who can create and publish forms

Scenario:
Given I am an admin
Then I should see the "Add and Instructor" button

Scenario:
Given I am a student
And I go to "Make a new form"
Then I should not be on the new/edit survey page
And I should see an error message

Scenario:
Given I am an instructor
And I do not have permission to create forms
And I go to "Make a new form"
Then I should not be on the new/edit survey page
And I should see an error message

Scenario:
Given I am an instructor
And I have permission to create forms
And I go to "Make a new form"
Then I should be on the new/edit survey page