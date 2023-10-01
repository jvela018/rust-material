# Hello Game

This section creates the main project structure as a Hello world example for game development

# Instructions

1. Create a new project called flappy

```bash
cargo new flappy
```

2. Add dependency __bracket-lib__ to your __Cargo.toml__ file under the flappy project such that

```rust
[package]
name = "hello_bterm"
version = "0.1.0"
authors = ["Jonathan Velasco <jonvelasco00@gmail.com>"]
edition = "2021"

[dependencies]
bracket-lib="~0.8.1"
```

The tilde (~) means that it will use verison 0.8 as the base but accepts patches if bugs appear on that version.

3. Go to your main.rs file and add 

```rust
use bracket_lib::prelude::*;
```

The astrerisk is a wild card, meaning it takes everything in the library, and it's exported via prelude which is Rust convention that saves you from prefixing every call into the library.

4. Let's create a struct in your project to store the game state.

```rust
struct State{}
```

5. Now add traits, which are a way to define shared functionality for objects. These are also known as interfaces in other languages. Bracket-lib defines a trait for games state structures called GameState, and requires that the object implement a __tick__ function. Traits are implemented similarly to methods for a struct

```rust
impl GameState for State{
    fn tick(&mut self, ctx: &mut BTerm){
        ctx.cls();
        ctx.print(1,1,"Hello Game - Bracket Terminal!");
    }
}
```
__ctx__ stands for context, provides functions for interacting with the game display and __cls__ clears the screan. And print provides an interface for printing text onto the game window. NOTE: it's print and __NOT__ println!. Last but not least the numbers __1,1__ are coordinates on where you want this message to be printed. __Bracket-lib__ defines 0,0 at the top left window. See page 113 on Kindle version of the book ---Chapter 3-- to see image describing the positioning.

6. In error handling, you can use a Result type to return whether the initialization of bracket-lib succeded or not. You can use unwrap and program will crash if any error occurs. However, unwrap can add complexity to the code making it hard to read, because it requires a match statement for each function that might fail. An alternative is to use the __?__ command. This command __MUST__ return a __Result__ type, unlike match that handles multiple types. Bracket-lib provides a __Result__ type called __BError__ and you can add it to your main function as

```rust
fn main() -> BError{}
```

7. __Create terminal instance__ The bracket-lib uses a builder pattern. The initial constructor function returns the builder. You can start with the requested display mode (e.g. simple80x50), add title, font, etc. At the end you must call a build function to return the completed object or an error.

```rust 
let context = BTermBuilder::simple80x50()
    .with_title("Flappy Dragon")
    .build()?;
```

8. Now we can tell bracket-lib to start executing the game in a loop, and link the engine with your __State__ so that bracket-lib knows where the tick function is located

```rust
main_loop(context,State{})
```

# Solution

```rust
use bracket_lib::prelude::*;

struct State {}

impl GameState for State {
    fn tick(&mut self, ctx: &mut BTerm) {
        ctx.cls();
        ctx.print(1, 1, "Hello Game - Bracket Terminal!");
    }
}

fn main() -> BError {
    let context = BTermBuilder::simple80x50()
        .with_title("Flappy Dragon")
        .build()?;

    main_loop(context, State {})
}

```