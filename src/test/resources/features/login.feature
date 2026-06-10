@regression
Feature: Login API Validation

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'

  @smoke
  Scenario: Successful login with valid credentials
    Given path '/auth/login'
    And request { "username": "divya@test.com", 
                  "password": "pass123" }
    When method POST
    Then status 200
    And match response.token == '#notnull'
    And match response.message == 'Login successful'
    * def authToken
