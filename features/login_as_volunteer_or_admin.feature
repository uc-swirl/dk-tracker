Feature: login as volunteer

  As a volunteer
  So that I can submit surveys
  I want to provide a login page

Background: users in database

  Given the following users exist:
  | name     | phone_number | email            | password  | Type      |
  | Joe Blow | 867-5309     | jb@berkeley.edu  | 12345     | Volunteer |
  | Kay Nine | 456-7890     | lilbjr@gmail.com | #k_9      | Admin     |

Scenario: Login successfully as a Volunteer
  Given I am on the login page as Joe Blow
  And  I fill in "Username" with jb@berkeley.edu
  And  I fill in "Password" with 12345
  When I click on "Login"
  Then I should be directed to the Volunteer page
  And I should not be directed to the Admin page

Scenario: Login unsuccessfully as a Volunteer
  Given I am on the login page as Joe Blow
  And  I fill in "Username" with jb@berkeley.edu
  And  I fill in "Password" with "Not Joe Blow's password"
  When I click on "Login"
  Then I should be redirected to the login page
  And  it should display Username or Password incorrect

Scenario: Login successfully as Admin
  Given I am on the login page as Kay Nine
  And I fill in "Username" with lilbjr@gmail.com
  And I fill in "Password" with #k_9
  When I click on "Login"
  Then I should be directed to the Admin page
  And I should not be directed to the Volunteer page