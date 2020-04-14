Feature: User can add manually a movie

Scenario: Add a new movie
    Given I am on the Rottenpotatoes home page
    When I follow "Add a new movie"
    Then I should be on the Create New Movie Page
    When I fill in "Title" with "Men"
    And I select "PG" from "Rating"
    And I press "Save Changes"
    Then I should be on the Rottenpotatoes home page
    And I should see "Men"
