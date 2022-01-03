Feature: String Calculator
Scenario: Empty string gives zero
	Given the input is ""
	When add is called
	Then the result is 0

Scenario: Single number gives number
	Given the input is "1"
	When add is called
	Then the result is 1

Scenario: Two number can be added seperated by coma
	Given the input is "1,2"
	When add is called
	Then the result is 3

Scenario: String calculator can handle unknown amount of numbers
	Given the input is "1,1,1,1,1,1,1,1,1,1,500"
	When add is called
	Then the result is 510

Scenario: Newline is also a delimiter
	Given the input is "1\n2,3"
	When add is called
	Then the result is 6

Scenario: Delimiters can be registered in the beginning
	Given the input is "//;\n1;2"
	When add is called
	Then the result is 3