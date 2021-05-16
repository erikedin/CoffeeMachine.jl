Feature: Displaying messages

    Scenario Outline: Errors
        Given a machine without <ingredient>
         When a user makes a cup of coffee with milk
         Then the machine displays <message>

        Examples:
            | ingredient | message       |
            | coffee     | Out of coffee |
            | milk       | Out of milk   |
