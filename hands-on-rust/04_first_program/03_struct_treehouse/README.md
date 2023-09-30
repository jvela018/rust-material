# Struct Treehouse

To create visitor instances, this program will be built using visitor structs. If you're in the list,they welcome them, otherwise they're not allowed in the tree house

The main goals in this example is to learn about structs and searching with iterators

# Starting point

1. Create a new project and copy the following code onto main.rs

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

# Instructions

1. Define a struct type named Visitor that contains a name and greeting field, each of type String

```rust
#[derive(Debug)]
struct Visitor {
name: String,
greeting: String,
}
```

2. Structures can also be associated with functions and methods. Making a visitor should be easy, so you need to create a constructor. Constructors are functions associated with a type that provides a quick way to create an instance for that type. To implement functions for a structure, use impl and the struct name as follows

```rust
impl Visitor {
fn new(name: &str, greeting: &str) -> Self {
    Self {
        name: name.to_lowercase(),
        greeting: greeting.to_string(),
    }
}
fn greet_visitor(&self) {
    println!("{}", self.greeting);
}
}
```

3. Update the visitor list, using the new struct

```rust
let visitor_list = vec![
    Visitor::new("bert", "Hello Bert, Enjoy your treehouse."),
    Visitor::new("steve", "Hi Steve. Your milk is in the fridge."),
    Visitor::new("fred", "Wow, whos invited Fred?."),
];
```

4. __Searching with iterators__ . Iterators include a find function to locate data within a collection -- whether it's an array, a vector, or something else. Replace the original for loop with the following:

```rust
let known_visitor = visitor_list.iter().find(|visitor| visitor.name == name);

```

5. The function chain creates an iterator and stores the results of the find function in known_visitor. You can't be sure that the name you searched for is on the visitor list. Find returns a Rust type called an Option. Option either contains a value or they don't. Some language use null or nullptr to represent absence of a value but weak rules for handling null values have resulted in countless bugs.Rust options are enumeration. Add the following code immediately after the known_visitor assignment

```rust
match known_visitor {
    Some(visitor) => visitor.greet_visitor(),
    None => println!("You're not on the visitor list. Please, leave"),
}
```

6. Run the program


# Solution

```rust
use std::io::stdin;

struct Visitor {
    name: String,
    greeting: String,
}

impl Visitor {
    fn new(name: &str, greeting: &str) -> Self {
        Self {
            name: name.to_lowercase(),
            greeting: greeting.to_string(),
        }
    }
    fn greet_visitor(&self) {
        println!("{}", self.greeting);
    }
}

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

    let visitor_list = [
        Visitor::new("bert", "Hello Bert, enjoy your treehouse."),
        Visitor::new("steve", "Hi Steve. Your milk is in the fridge"),
        Visitor::new("fred", "Wow, who invited Fred?"),
    ];

    let known_visitor = visitor_list.iter().find(|visitor| visitor.name == name);

    match known_visitor {
        Some(visitor) => visitor.greet_visitor(),
        None => println!("You're not on the visitor list. Please, leave"),
    }
}

```
