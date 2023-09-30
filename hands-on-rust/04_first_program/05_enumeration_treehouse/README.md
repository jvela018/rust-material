# Enumeration Treehouse


This program adds Rust enums to add functionality to the bouncer. The bouncer will treat visitors differently and know whether they can drink alcohol. Hence, we need to store an action associated with a visitor and the visitor's age, verify drinking age.

Rust enumerations can include data and functions.


# Starting Point

```rust
use std::io::stdin;

#[derive(Debug)]
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


# Instructions

1. Add visitor actions as an enum variable

```rust
#[derive(Debug)]
enum VisitorAction{
    Accept,
    AcceptWithNote {note:String},
    Refuse,
    Probation,
}
```

2. Add field for visitor's age to your Visitor's struct

```rust
#[derive(Debug)]
struct Visitor{
    name: String,
    action: VisitorAction,
    age:i8
}
```

3. Initialize fields. Not iniializing fields will result in compilation error. Modify Visitor implementation (impl)

```rust
fn new(name: &str, action: VisitorAction, age:i8) -> Self{
    Self{
        name: name.to_lowercase(),
        action,
        age
    }
}
```

4. Replace visitor list to include VisitorAction

```rust
let mut visitor_list = vec![
    Visitor::new("bert", VisitorAction::Accept, 45),
    Visitor::new("steve", VisitorAction::AcceptWithNote{note: String::from("Lactose-free milk is in the fridge")}, 15),
    Visitor::new("fred", VisitorAction::Refuse, 30),
];
```

5. __Matching with enumeration__. Enumerations are complex so you need to be careful when comparing things. You need to use pattern matching. This way you check if a condition is true and runs the associated code, and it can extract cfields from complex types. This requires the use of the "fat arrow" which is different to the way we performed comparisons in the previous section. Add a greet_visitor function to your Visitor implementation 

```rust
fn greet_visitor(&self) {
    match &self.action {
      VisitorAction::Accept => println!("Welcome to the tree 
          house, {}", self.name), 
      VisitorAction::AcceptWithNote { note } => { 
          println!("Welcome to the treehouse, {}", self.name);
          println!("{}", note); 
          if self.age < 21 { 
              println!("Do not serve alcohol to {}", self.name);
          }
      }
      VisitorAction::Probation => println!("{} is now a 
          probationary member", self.name),
      VisitorAction::Refuse => println!("Do not allow {} in!", self.name),
      }
  }
```

6. Edit your visitor_list.push to create new visitors with probation status

```rust
visitor_list.push(Visitor::new(&name, VisitorAction::Probation,0));
```