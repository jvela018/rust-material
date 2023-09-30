# Array Treehouse

This program asks the user for their name and if they're on the list, they welcome them, otherwise they're not allowed in the tree house

The main goals in this example is to learn about functions, arrays, trimming input, conditionals and iterators

# Instructions

1. Create a project called list_checker
```bash
cargo new list_checker
```

2. Go to list_checker/src/main.rs and edit it to look like

```rust
use std::io::stdin;
fn main() {
  println!("Hello, what's your name?");
  let mut your_name = String::new();
  stdin()
      .read_line(&mut your_name)
      .expect("Failed to read line");
  println!("Hello, {}", your_name);
}
```

3. After typing/copying it, format it to ensure coding style 

```bash
cargo fmt
```

4. Move reading the name to a function called whats_your_name such that

```rust
fn what_is_your_name() -> String{
let mut your_name = String::new();
stdin()
	.read_line(&mut your_name)
	.expect("Failed to read line");
your_name
}
```

5. Add your new function to main such that

```rust
fn main(){
println!("Hello, what's your name?");
let name = what_is_your_name();
println!("Hello, {}", name);
}
```

6. __Trimming input__: The user input might contain escape characters. To see the characters you can use __println!("{:?}", name);__. If we're going to check whether the name entered is in the list, we need some control over it. Let's trim the input by applying two operations:trim() and to_lowercase(). These remove the escape/extra characters and turns the name from any case to lowercase. Modify the __whats_your_name()__ function so that the return value is trimmed and lower case

```rust
fn what_is_your_name() -> String{
let mut your_name = String::new();
stdin()
	.read_line(&mut your_name)
	.expect("Failed to read line");
your_name.trim().to_lowercase()
}
```

7. __Declaring an Array__ with the visitor list information in main()

```rust
let visitor_list=["bert", "steve", "fred"];
```

8. Create a boolean variable __let mut allow_them_in=false__. This will serve as a flag to validate if the user is allowed to enter the tree house

```rust
let mut allow_them_in=false;
```

9. __For Loop__. Iterate over every member of your array and if the user input matches anyone in the visitor list, switch allow_them_in to true such that

```rust
for visitor in &visitor_list{
if visitor==&name{
	allow_them_in=true;
}
}
```

10. Lastly, create a custom message for both cases: when they are allowed in, and when they're not

```rust
if allow_them_in{
println!("Welcome to the Treehouse {}", name);
}else{
println!("Sorry, you aren't on the list.");
}
```

11. Run your program to test it



# List Checker Program

Here's the full solution of the problem

```rust
use std::io::stdin;

fn what_is_your_name() -> String {
    let mut your_name = String::new();
    stdin()
        .read_line(&mut your_name)
        .expect("Failed to read line");
    your_name.trim().to_lowercase()
}

fn main() {
    println!("Hello, what's your name?");
    let name = what_is_your_name();

    let visitor_list = ["bert", "steve", "fred"];
    let mut allow_them_in = false;
    for visitor in &visitor_list {
        if visitor == &name {
            allow_them_in = true;
        }
    }
    if allow_them_in {
        println!("Welcome to the Treehouse {}", name);
    } else {
        println!("Sorry, you aren't on the list.");
    }
}
```


