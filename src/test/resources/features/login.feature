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
    * def authToken = response.token

  @smoke
  Scenario: Login with invalid credentials
    Given path '/auth/login'
    And request { "username": "wrong@test.com", 
                  "password": "wrongpass" }
    When method POST
    Then status 401
    And match response.message == 'Invalid credentials'

  @regression
  Scenario Outline: Login with multiple users
    Given path '/auth/login'
    And request { "username": "<username>", 
                  "password": "<password>" }
    When method POST
    Then status <expectedStatus>

    Examples:
      | username          | password  | expectedStatus |
      | divya@test.com    | pass123   | 200            |
      | admin@test.com    | admin123  | 200            |
      | wrong@test.com    | wrong123  | 401            |
      | divya@test.com    |           | 400            |

  @regression
  Scenario: Chain login token to get user details
    # Step 1 - Login and extract token
    Given path '/auth/login'
    And request { "username": "divya@test.com", 
                  "password": "pass123" }
    When method POST
    Then status 200
    * def authToken = response.token

    # Step 2 - Use token in next request
    Given path '/users/profile'
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.email == 'divya@test.com'
    And match response.role == '#notnull'
