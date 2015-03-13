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
    And I have logged in as alex@incredible.com with password password123
    Then I should be directed to the volunteer dashboard
    And I should not be directed to the admin dashboard

  Scenario: Login unsuccessfully as a Volunteer
    Given I am on the volunteer login page
    And I have logged in as alex@incredible.com with password notmypassword
    Then I should be redirected to the volunteer login page
    And  I should see "Username or Password incorrect"

  Scenario: Login successfully as Admin
    Given I am on the admin login page
    And I have logged in as ben@poodles.com with password 123password
    Then I should be directed to the admin dashboard
    And I should not be directed to the volunteer dashboard