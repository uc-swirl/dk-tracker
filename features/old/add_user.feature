Feature: Add user 
	As a volunteer organizer, in order to manage my volunteers, 
	I would like to be able to add a volunteer user so that they
	can login to the app and access surveys. 

  Background:
    Given the following users exist:
    | firstname | lastname    | phone_number   | email               | admin | password       |
    | Alex      | Lin         | 17072238447    | alex@incredible.com | false | password123    |
    | Ben       | Luu         | 17072238442    | ben@poodles.com     | true  | 123password    |

Scenario: add a user to be a volunteer
  Given I am on the admin login page
  And I have logged in as ben@poodles.com with password 123password
  When I follow "Add User" 
  And I fill in "user_email" with "clancy@h.com"
  And I fill in "user_password" with "12345678"
  And I press "Create"
  Then I should see "Succesfully added user"
  And "clancy@h.com" should be a user

Scenario: fail to add a user as a volunteer
  Given I am on the admin login page
  And I have logged in as ben@poodles.com with password 123password
  When I follow "Add User" 
  And I fill in "user_email" with "clancy@h.com"
  And I fill in "user_password" with "178"
  And I press "Create"
  Then I should see "Invalid field"
  And "clancy@h.com" should not be a user
