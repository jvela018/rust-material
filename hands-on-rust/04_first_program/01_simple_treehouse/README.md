# The Greeter Program

In this example we'll be covering getting user input, printing with and without place holders.


# Instructions

1. __Create new project__:
  ```
  cargo new greeter_program
  ```

2. Go into project source

  ```
  cd greeter_program/src
  ```

3. __Printing__: Edit main.rs to ask the visitor's name
  ```
  println!("Hello, what's your name?");
  ```

4. __Creating a variable__: To __store the visitor's name__ in a variable, we create a mutable variable (variables in Rust are immutable by default). This is because the declaration of the your_name variable will change once the user enters their name.

Add the following line of code to your program

  ```
  let mut your_name = String::new();
  ```
This code creates a mutable variable named your_name, and it sets it to be an empty string.

5. __Using Rust's standard input system__: Rust provides terminal functions in  std::io::stdin. To avoid writing std:io:stdin:read_line (similar to scanf C), import the name with Rust's use keyword (similar to include in C)). Add the following line at the top of the project:

  ```
  use std::io::stdin;
  ```

6. __Reading user input__: having access to stdin, gives us access to read from the console input add this line after the declaration of your variable your_name

  ```
  stdin()
	  .read_line(&mut your_name)
	  .expect("Failed to read line");
  ```

Combining functions like this is called function chaining.

Note that read_line wants to write its results into an existing string, rather than returning to a new one. Hence, the creation of the variable your_name before reading and storing.

In Rust the language used for variables with an & (ampersand) is also called borrowing - you're lending the variable to the function you're calling. Lending with &mut permits the borrowing function to mutate your variable (similar to passing by reference in C).

The second funciton expect() behaves similarly to assert() in C.

7. __Printing with Placeholders__: you can use {} to print your variables. Enter the following line in your code

  ```
  println!("Hello, {}", your_name);
  ```

8. Run your Greeter Program (remember to do it from greeter_program and not from src!!)
  ```
  cargo run
  ```

## Summary

If you have completed all the steps, you'll end up with a __Greeter Program__ that asks for your name, receives user input, and prints the name back on the console.
