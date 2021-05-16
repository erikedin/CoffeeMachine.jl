Feature: Making Coffee

    Scenario: Making a regular coffee
        Given a machine filled with coffee beans
         When a user makes a cup of coffee
         Then the cup contains coffee

    Scenario: Making coffee with milk
        Given a machine filled with coffee beans
          And that the machine also has milk
         When a user makes a cup of coffee with milk
         Then the cup contains coffee
          And the cup contains milk