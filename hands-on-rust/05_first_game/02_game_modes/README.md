# Game Modes

What should the game do on the current tick. For that, we need to implement modes to define the basic game structure

For the Flappy Dragon game, we'll implement three modes:

- Menu
- Playing
- End 

In a flowchart the modes would look something like

Menu => Playing = Player Dies => End
                <= Play Again =

The modes are represented as an enum

# Starting point

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

# Instructions



1. Create a GameMode enum type

```rust 
enum GameMode{
    Menu,
    Playing,
    End,
}
```

2. Store modes in State struct

```rust
struct State {
    mode:GameMode,
}
```

3. Initialize struct

```rust
impl State{
    fn new()->Self{
        State{
            mode:GameMode::Menu,
        }
    }
}
```

3. Replace initialization in main with a call to the new constructor

```rust
main_loop(context, State::new())
```

4. Replace tick function to handle the current mode

```rust
impl GameState for State{
    fn tick(&mut self, ctx:&mut BTerm){
        match self.mode{
            GameMode::Menu => self.main_menu(ctx),
            GameMode::End => self.dead(ctx),
            GameMode::Playing => self.play(ctx),
        }
    }
}
```

5. Some states need to be worked out in the implementation for now, add a play function under the State implementation

```rust
fn play(&mut self, ctx:&mut BTerm){
    // TODO: Fill this in stub later
    self.mode = GameMode::End;
}
```

6. The main menu needs to display the menu and respond to user input and change the mode to playing, and reset all game states. For now let's just implement the Playing mode just to set mode to Playing

```rust
fn restart(&mut self){
    self.mode = GameMode::Playing;
}
```

7. Add a __main_menu__ function to the State implementation to clear screen and print menu options

```rust
fn main_menu(&mut self, ctx: &mut BTerm){
    ctx.cls();
    ctx.print_centered(5, "Welcome to Flappy Dragon");
    ctx.print_centered(8, "(P) Play Game");
    ctx.print_centered(9, "(Q) Quit Game");
}
```

8. Now we need to check for input that triggers the menu options. BTerm includes a __Key__ variable as an __Option__ type. A shortened version of __match__ for single cases is __if let__. See page 122

```rust
if let Some(key) = ctx.key{
match key{
    VirtualKeyCode::P = self.restart(),
    VirtualKeyCode::Q => ctx.quitting = true,
    _=>{}
}
}
```

9. Show menu options when game ends

```rust
fn dead(&mut self, ctx: &mut BTerm){
    ctx.cls();
    ctx.print_centered(5, "You're dead!");
    ctx.print_centered(8, "(P) Play again");
    ctx.print_centered(9, "(Q) Quit Game");

    if let Some(key) = ctx.key{
        match key{
            VirtualKeyCode::P => self.restart(),
            VirtualKeyCode::Q => ctx.quitting = true,
            _=>{}
        }
    }
}
```

10. Run the program and test the game control flow

```rust
cargo run
```
