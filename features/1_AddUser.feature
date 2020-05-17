Feature: Aggiunge un User al sistema
Scenario: AddUser
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
    And I should see "user_cucumber"



