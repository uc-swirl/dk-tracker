Feature: login as volunteer

  As a volunteer
  So that I can submit surveys
  I want to provide a login page

  Background: 
    Given the following users exist:
      | firstname | lastname   | phone_number   | email               | admin | password       |
      | Alex      | Lin        | 17072238447    | alex@incredible.com | false | password123    |
      | Ben       | Luu        | 17072238442    | ben@poodles.com     | true  | 123password    |


  Scenario: Login successfully as a Volunteer
    Given I am on the volunteer login page
    And  I fill in "Username" with alex@incredible.com
    And  I fill in "Password" with password123
    When I click on "Login"
    Then I should be directed to the Volunteer page
    And I should not be directed to the Admin page

  Scenario: Login unsuccessfully as a Volunteer
    Given I am on the volunteer login page
    And  I fill in "Username" with alex@incredible.com
    And  I fill in "Password" with "Not Joe Blow's password"
    When I click on "Login"
    Then I should be redirected to the login page
    And  it should display Username or Password incorrect

  Scenario: Login successfully as Admin
    Given I am on the admin login page
    And I fill in "Username" with alex@incredible.com
    And I fill in "Password" with 123password
    When I click on "Login"
    Then I should be directed to the Admin page
    And I should not be directed to the Volunteer page