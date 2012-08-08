bbc-roman-kata
==============

General Approach

    The approach was to tdd the basic numerals, leading to an iterative approach.
    The code was reminicient of eculids's gcd algorythm leading to use of modulus arithmatic to
    remove some duplication and facilitate a more compact rendering.

    A very simple continous integration environment (Makefile and JsTestDriver/Node.js) was developed
    to provide an easy red-green-refactor workflow.

    For a bit of fun, I reimplemented the same kata in ruby (in ruby/roman_numerals_kata.rb)

Assumptions
    Assumes input is a valid numeric integer as per the interface specification provided.

Caveats to solution
    Doesn't handle zero, negative numbers, or positive numbers > 3999, an exception is raised.


The makefile supports the following targets:

start_server
stop_server
clean
check
check-all

