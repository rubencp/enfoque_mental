Feature: Receive SMS from Twilio
  In order to receive a SMS an API entrypoint is required

  Scenario: The application is running
    Given Application is ready
    Then the route is valid to receive mesages from twilio

  Scenario: A message is received from Twilio
    Given the message includes the phone number
      And its number is not recognized
     Then create a new user with the phone number information
      And Assign a Survey to the new user

  Scenario: A message is received from Twilio
    Given the message does not have the expected structure
     Then discard the message and do nothing