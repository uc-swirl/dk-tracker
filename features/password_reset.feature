Feature: Password reset

As a volunteer, in order to always have access to my account, 
I would like to be able to reset my password. 

Background: 
	Given the following users exist:
	  | firstname | lastname   | phone_number   | email               | admin | password       |
	  | Alex      | Lin        | 17072238447    | alex@incredible.com | false | password123    |
	  | Ben       | Luu        | 17072238442    | ben@poodles.com     | true  | 123password    |

	


Scenario: Volunteers should be able to find the password reset page.
    Given I am on the volunteer login page
    And I follow "Forgot password?"
    Then I should be redirected to the password reset page

Scenario: Admins should be able to find the password reset page.
    Given I am on the admin login page
    And I follow "Forgot password?"
    Then I should be redirected to the password reset page

Scenario: If I enter an valid email, I should get a confirmation email
    Given I am on the password reset page
    And I fill in "user_email" with "alex@incredible.com"
   	Then I press "Reset Password"
   	Then an email should be sent


Scenario: If I enter an invalid email, I should get a notice
    Given I am on the password reset page
    And I fill in "user_email" with "asd@asd.com"
   	Then I press "Reset Password"
   	Then I should see "Email not found"


