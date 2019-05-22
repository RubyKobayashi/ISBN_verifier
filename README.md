# README
ISBN verifier tech test for Homeflow

* Ruby version '2.6.0'


To set-up this project on a local machine:
1) Clone this repo
2) To install gems, in terminal run command:
   'bundle'


To run tests:
In terminal run command:
 'rspec'


**User Stories:**

* Users are notified with an error if their input is not a string

```
As a user,
So I know my ISBN code is in the right format
I want to be notified with an error if my ISBN code is not a string
```
* Users with invalid ISBN codes due to incorrect length of digits will be notified

```
As a user,
So I know my ISBN code has the correct number of digits
I want to be notified with an error if the code is under or over 10 digits
```

* Users can input codes ending with an 'X' and still have their code evaluated

```
As a user,
So I can have ISBN codes ending with an 'X' verified correctly
I want the 'X' to equal 10
```

* Users can input ISBN codes for validation without hyphens

```
As a user,
So I can have ISBN code without hyphens verified correctly
I want the program to be able to read codes without hyphens
```

* Users can input ISBN codes for validation with hyphens

```
As a user,
So I can have ISBN code with hyphens verified correctly
I want the program to be able to read codes with hyphens
```

* Users with correct validation codes will be notified that they have a valid ISBN code

```
As a user,
So I know when I have a valid ISBN code
I want the program to confirm that I have a valid ISBN code
```




* How to run the test suite
  To install rspec:
  In teminal run command:
  rails generate rspec:install

  To run tests:
  In terminal run command:
  rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
