@cisco @tasks-field-permission
Feature:
  As a tester
  We are verifying the field permission for task entity

  @tasks-field-permission
  Scenario Outline: verify the role field permission for tasks
    Given I should login as a "<User_Role>"
    When I wait for 5 seconds
    When I click on new button under my task section
    Then I should see the following:
      """
      New Task
      Select Task Record Type
      """
    When I select "Task - Lead" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    And I should verify "<field_name>" field permission for "<User_Role>" with cell value "<cell_value>" for tasks entity

    Examples:
      | User_Role    | field_name          | cell_value |
      | OpsManager   | Status              | 2          |
      | OpsRep       | Status              | 2          |
      | SalesManager | Status              | 2          |
      | SalesRep     | Status              | 2          |
      | SalesOps     | Status              | 2          |
      | OpsManager   | Task Record Type    | 3          |
      | OpsRep       | Task Record Type    | 3          |
      | SalesManager | Task Record Type    | 3          |
      | SalesRep     | Task Record Type    | 3          |
      | SalesOps     | Task Record Type    | 3          |
      | OpsManager   | SREV Amount         | 4          |
      | OpsRep       | SREV Amount         | 4          |
      | SalesManager | SREV Amount         | 4          |
      | SalesRep     | SREV Amount         | 4          |
      | SalesOps     | SREV Amount         | 4          |
      | OpsManager   | Cisco Amount        | 5          |
      | OpsRep       | Cisco Amount        | 5          |
      | SalesManager | Cisco Amount        | 5          |
      | SalesRep     | Cisco Amount        | 5          |
      | SalesOps     | Cisco Amount        | 5          |
      | OpsManager   | SREV Health Score   | 6          |
      | OpsRep       | SREV Health Score   | 6          |
      | SalesManager | SREV Health Score   | 6          |
      | SalesRep     | SREV Health Score   | 6          |
      | SalesOps     | SREV Health Score   | 6          |
      | OpsManager   | Cisco Health Score  | 7          |
      | OpsRep       | Cisco Health Score  | 7          |
      | SalesManager | Cisco Health Score  | 7          |
      | SalesRep     | Cisco Health Score  | 7          |
      | SalesOps     | Cisco Health Score  | 7          |
      | OpsManager   | Qualtrics Link      | 8          |
      | OpsRep       | Qualtrics Link      | 8          |
      | SalesManager | Qualtrics Link      | 8          |
      | SalesRep     | Qualtrics Link      | 8          |
      | SalesOps     | Qualtrics Link      | 8          |
      | OpsManager   | Inhibitors          | 9          |
      | OpsRep       | Inhibitors          | 9          |
      | SalesManager | Inhibitors          | 9          |
      | SalesRep     | Inhibitors          | 9          |
      | SalesOps     | Inhibitors          | 9          |
      | OpsManager   | Achieved Outcomes   | 10         |
      | OpsRep       | Achieved Outcomes   | 10         |
      | SalesManager | Achieved Outcomes   | 10         |
      | SalesRep     | Achieved Outcomes   | 10         |
      | SalesOps     | Achieved Outcomes   | 10         |
      | OpsManager   | Features            | 11         |
      | OpsRep       | Features            | 11         |
      | SalesManager | Features            | 11         |
      | SalesRep     | Features            | 11         |
      | SalesOps     | Features            | 11         |
      | OpsManager   | Desired Outcomes    | 12         |
      | OpsRep       | Desired Outcomes    | 12         |
      | SalesManager | Desired Outcomes    | 12         |
      | SalesRep     | Desired Outcomes    | 12         |
      | SalesOps     | Desired Outcomes    | 12         |
      | OpsManager   | Product             | 13         |
      | OpsRep       | Product             | 13         |
      | SalesManager | Product             | 13         |
      | SalesRep     | Product             | 13         |
      | SalesOps     | Product             | 13         |
      | OpsManager   | At Risk Reason      | 14         |
      | OpsRep       | At Risk Reason      | 14         |
      | SalesManager | At Risk Reason      | 14         |
      | SalesRep     | At Risk Reason      | 14         |
      | SalesOps     | At Risk Reason      | 14         |
      | OpsManager   | Lead ID             | 15         |
      | OpsRep       | Lead ID             | 15         |
      | SalesManager | Lead ID             | 15         |
      | SalesRep     | Lead ID             | 15         |
      | SalesOps     | Lead ID             | 15         |
      | OpsManager   | Customer Sentiment  | 16         |
      | OpsRep       | Customer Sentiment  | 16         |
      | SalesManager | Customer Sentiment  | 16         |
      | SalesRep     | Customer Sentiment  | 16         |
      | SalesOps     | Customer Sentiment  | 16         |
      | OpsManager   | SREV Health Status  | 17         |
      | OpsRep       | SREV Health Status  | 17         |
      | SalesManager | SREV Health Status  | 17         |
      | SalesRep     | SREV Health Status  | 17         |
      | SalesOps     | SREV Health Status  | 17         |
      | OpsManager   | Escalation          | 18         |
      | OpsRep       | Escalation          | 18         |
      | SalesManager | Escalation          | 18         |
      | SalesOps     | Escalation          | 18         |
      | SalesRep     | Escalation          | 18         |
      | OpsManager   | Contact             | 19         |
      | OpsRep       | Contact             | 19         |
      | SalesManager | Contact             | 19         |
      | SalesRep     | Contact             | 19         |
      | SalesOps     | Contact             | 19         |
      | OpsManager   | Cisco Health Status | 20         |
      | OpsRep       | Cisco Health Status | 20         |
      | SalesManager | Cisco Health Status | 20         |
      | SalesRep     | Cisco Health Status | 20         |
      | SalesOps     | Cisco Health Status | 20         |