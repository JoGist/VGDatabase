Feature: Aggiunge un gioco alla libreria
Scenario: AddGame
    Given I am on the VGDatabase_login
    When I follow "Sign Up"
    Then I should be on the VGDatabase_signup
    When I fill in "user[name]" with "mail@caso"
    And I fill in "user[name1]" with "user_cucumber"
    And I fill in "user[password]" with "prova"
    And I fill in "user[password1]" with "prova"
    And I press "Sign up"
    Then I should be on the VGDatabase_login
    When I fill in "user[name]" with "user_cucumber"
    And I fill in "user[password]" with "prova"
    And I press "Log In"
    Then I should be on the VGDatabase_homepage
    When I follow "My library"
    Then I should be on the VGDatabase_library
    And I should see "You don't have any games in your library"
    When I follow "Search"
    Then I should be on the VGDatabase_searchGame
    When I fill in "search" with "dark sector"
    And I press "search"
    Then I should be on the VGDatabase_searchGameResult
    When I follow "add"
    Then I should be on the VGDatabase_library
    And I should see "You have 1 game in your library"

