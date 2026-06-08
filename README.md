# Karate API Automation Framework

API Test Automation Framework built using Karate BDD 
with parallel execution and CI/CD integration.

## Tech Stack
- Karate BDD 1.x
- Java 11
- Maven
- Jenkins CI/CD
- GitHub Actions
- HTML Reports (built-in)

## Framework Structure
src/test/
  java/runner/         → Parallel test runner
  resources/features/  → Feature files
  resources/           → karate-config.js

## How to Run
# Run all tests
mvn test

# Run smoke tests only
mvn test -Dkarate.options="--tags @smoke"

# Run on staging environment
mvn test -Dkarate.env=staging

## Parallel Execution
Configured to run with 5 threads — reduces 
execution time by 80%.

## Reports
Built-in Karate HTML reports generated at:
target/karate-reports/karate-summary.html
