FibonacciUiTableViewSwift
=========================

Fibonacci Sequence in Swift, placed on a UiTableView

Places a Fibonacci Sequence of numbers in a UiTableView in the Swift programming langauge

Uses Two ways of creating the sequence, one is using a Generator/Sequence type and iterating through the generate() function

This is a common answer to writing a Fibonacci Sequence in Swift but it seems, at least in the case of adding the sequence to a 
UITableField via an Int array, that a simple recursive method runs much faster and doesn't bog down the CPU.

The second way of creating the sequence is thus that faster method (called simpleRecursive)

The numbers are inputed by the user with a UITextField.

Current Bugs:
GUI was done really fast so it only looks correct on iPhone screens.  Could be edited with autolayout to work universally 

![My image](http://i.imgur.com/D18P5ln.png)
