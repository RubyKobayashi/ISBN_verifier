# README


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

* Users with a valid ISBN codes will be notified that they have a valid ISBN code

```
As a user,
So I know when I have a valid ISBN code
I want the program to confirm that I have a valid ISBN code
```

* Users with an invalid validation code will be notified that they have an invalid ISBN code

```
As a user,
So I know when I have an invalid ISBN code
I want the program to confirm that I have a invalid ISBN code
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

* Users can input codes ending with an 'X' and still have their code evaluated

```
As a user,
So I can have ISBN codes ending with an 'X' verified correctly
I want the 'X' to equal 10
```

* Users with an invalid ISBN code ending in 'X' will be notified they have an invalid ISBN code
```
As a user,
So I can have invalid ISBN codes ending with an 'X' evaluated
I want to be notified that I have an invalid ISBN code
```

* Bonus Features
* Users can convert their valid ISBN-10 codes without hyphens into ISBN-13 codes
```
As a user,
If I have a valid ISBN-10 code without hyphens
I want to be able to convert it into an ISBN-13 code
```

* Users can convert their valid ISBN-10 codes with hyphens into ISBN-13 codes
```
As a user,
If I have a valid ISBN-10 code with hyphens
I want to be able to convert it into an ISBN-13 code
```

* Users are notified that an ISBN-13 code cannot be generated if they have an invalid ISBN-10 code with hyphens
```
As a user,
If I have an invalid ISBN-10 code with hyphens
I want to be notified that an ISBN-13 code cannot be generated
```

* Users can convert their valid ISBN-10 codes ending with X into ISBN-13 codes
```
As a user,
If I have a valid ISBN-10 code ending in an x
I want to be able to convert it into an ISBN-13 code
```

* Users are notified that an ISBN-13 code cannot be generated if they have an invalid ISBN-10 code with hyphens and ending in an X
```
As a user,
If I have an invalid ISBN-10 code with hyphens and ending in an X
I want to be notified that an ISBN-13 code cannot be generated
```

**Approach:**
```
In my approach to designing my solution for this tech test, I decided to design a back-end heavy command-line program with output to the terminal so that I could focus on the logic. My program consists of 3 classes 'Converter', 'Verifier' and 'Generator'.

The Converter class has light format conversions methods for ISBN-10 codes, namely '#delete_x' and '#delete_hyphens'. An instance of this is then injected into 'Verifier' which verifies to the user, whether their code input is in the correct format and whether they have a valid ISBN-10 or invalid ISBN-10 code. Lastly, the 'Generator, with a 'Converter' dependency injection generates ISBN-13 codes from valid ISBN-10 codes.

I stuck to a strict TDD process and have managed to achieve 100% test coverage with 40 passing tests.

I have implemented the core tasks, as well as all bar one of the bonus features. Given further time, I would have spent more time refactoring, focussing mainly on the Generator class. Lastly, I would have implemented a new 'Verifier' method with all its corresponding tests, which verifies whether you have a valid ISBN-13 code.


```
