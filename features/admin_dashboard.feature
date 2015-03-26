Feature: Admin Dashboard

  As a volunteer organizer 
  So that I can access the various features of ACCE Tracker
  I want to be shown a dashboard with links to admin features. 

  Background:
    Given the following users exist:
    | firstname | lastname    | email               | admin |
    | Alex      | Lin         | alex@incredible.com | false |
    | Ben       | Luu         | ben@poodles.com     | true  |

  Scenario: I should not be able to go to the admin dashboard if I'm not logged in as an admin
    Given I am on the admin dashboard
    Then I should be redirected to admin login

  Scenario: I should not be able to go to the admin dashboard if I am logged as a volunteer
    Given I am on the admin login page
    Given I have logged in as alex@incredible.com
    Given I am on the admin dashboard
    Then I should be redirected to the volunteer page

  Scenario: I should see links to available admin actions.
    Given I am on the admin login page
    Given I have logged in as ben@poodles.com
    And I am on the admin dashboard
    Then there should be some links to admin actions

  Scenario: I should be able to logout
    Given I am on the admin login page
    Given I have logged in as ben@poodles.com
    And I am on the admin dashboard
    When I follow "Logout"
    Then I should not be logged in
