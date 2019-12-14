Feature: signin
    In order to perform authentication to access the twitter page
    As a user 
    I want to sign in

  Background:
    Given John is at the twitter login page
  
  Scenario Outline: Sign in with valid credentials
     In order to login to the twitter app
     As a user John
     John wants to login with valid credentials
     When John sign in with username = "<username>" and password = "<password>"
     Then John is able to login as username = "<username>"

    Examples:
      | username              | password                     |
      | siow_chan@hotmail.com | demo_password_to_be_revoked  |   
     
  Scenario Outline: Cannot sign in with invalid credentials
     In order to validate login to the twitter app
        As a user
        John is not allowed to login with invalid credentials
     When John sign in with username = "<username>" and password = "<password>"
     Then John is unable to login as username = "<username>"

    Examples:
      | username              | password             |
      | siow_chan@hotmail.com | oops_wrong_password! |  
      
