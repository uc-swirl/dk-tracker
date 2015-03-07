Feature: login as volunteer

  As a volunteer
  So that I can submit surveys
  I want to provide a login page

  Given the following volunteers exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |

  Scenario: login successfully
    Given I am on the login page as a volunteer
    When I fill in "User" with ""
    And  I fill in "Director" with "Ridley Scott"
    And  I press "Update Movie Info"
    Then the director of "Alien" should be "Ridley Scott"

  Scenario: find movie with same director
    Given I am on the details page for "Star Wars"
    When  I follow "Find Movies With Same Director"
    Then  I should be on the Similar Movies page for "Star Wars"
    And   I should see "THX-1138"
    But   I should not see "Blade Runner"

  Scenario: can't find similar movies if we don't know director (sad path)
    Given I am on the details page for "Alien"
    Then  I should not see "Ridley Scott"
    When  I follow "Find Movies With Same Director"
    Then  I should be on the home page
    And   I should see "'Alien' has no director info"