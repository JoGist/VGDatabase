Feature: Cambia l'username e la password di un utente
Scenario: ChangeUserCred
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
    When I follow "My account"
    Then I should be on the VGDatabase_profile
    When I follow "Edit account info"
    Then I should be on the VGDatabase_Edit
    When I fill in "user[name]" with "new_cucumber"
    And I fill in "user[oldp]" with "prova"
    And I fill in "user[newp]" with "cucumber"
    And I fill in "user[newp1]" with "cucumber"  
    And I press "save"  
    Then I should be on the VGDatabase_Success
    When I follow "x"
    Then I should be on the VGDatabase_profile
    When I follow "Log out"
    Then I should be on the VGDatabase_login
    When I fill in "user[name]" with "new_cucumber"
    And I fill in "user[password]" with "cucumber"
    And I press "Log In"
    Then I should be on the VGDatabase_homepage
    And I should see "new_cucumber"
    



