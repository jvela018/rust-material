# Vector Treehouse


Arrays are fixed in size. Vectors are dynamically resizable. 

This program let's you add people to the visitor's list.


# Starting Point

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

# Instructions

1. Printing a single variable is simple. When using more complex variables such a structs, you might want to consider using the __Derive__ feature. If every field of the structure supports __Derive__ then it is as simple as using __{:?}__ placeholder in __println!__.

```rust
#[derive(Debug)]
struct Visitor{
    name: String,
    greeting: String
}
```

2. Rust vectors are similar to arrays and are easy to substitute by adding vec! at the front fo the array declaration

```rust
let visitor_list = vec![
    Visitor::new("bert", "Hello Bert, enjoy your treehouse."),
    Visitor::new("steve", "Hi Steve. Your milk is in the fridge"),
    Visitor::new("fred", "Wow, who invited Fred?"),
];
```

3. Keep running code without exiting when validating visitors using __loop__

```rust
loop{
    println!("Hello, what's your name?(Leave empty and press ENTER to quit)");
    let name = what_is_your_name();

    if name.is_empty(){
        break;
    } else{
        visitor_list.push(name, "Welcome to the treehouse");
    }
    
}
```

4. Change rejection message

```rust
    match known_visitor {
        Some(visitor) => visitor.greet_visitor(),
        None => {
            if name.is_empty(){
                break;
            }else{
                println!("{} is not on the visitor list.",name);
                visitor_list.push(Visitor::new(&name, "New Friend"));
            }
        }
    }
```

5. Print the visitor list. Since you are using the __Derive__ macro you can do

```rust
println!("The final list of visitors:");
println!("{:#?}", visitor_list);
```

# Solution
```rust
fn main() {
    let mut visitor_list = vec![
        Visitor::new("bert", "Hello Bert, enjoy your treehouse."),
        Visitor::new("steve", "Hi Steve. Your milk is in the fridge"),
        Visitor::new("fred", "Wow, who invited Fred?"),
    ];

    loop {
        println!("Hello, what's your name?");
        let name = what_is_your_name();
        let known_visitor = visitor_list.iter().find(|visitor| visitor.name == name);

        match known_visitor {
            Some(visitor) => visitor.greet_visitor(),
            None => {
                if name.is_empty() {
                    break;
                } else {
                    println!("{} is not on the visitor list.", name);
                    visitor_list.push(Visitor::new(&name, "New friend"));
                }
            }
        }
    }
    println!("The final list of visitors:");
    println!("{:#?}", visitor_list);
}
```