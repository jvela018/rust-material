# Adding a Player

This section shows us how to add players

# Starting point

Remember to edit the Cargo.toml

```
[package]
name = "hello_bterm"
version = "0.1.0"
authors = ["Jonathan Velasco <jonvelasco00@gmail.com>"]
edition = "2021"

[dependencies]
bracket-lib="~0.8.1"
```

```rust
use bracket_lib::prelude::*;

enum GameMode {
    Menu,
    Playing,
    End,
}

struct State {
    mode: GameMode,
}

impl State {
    fn new() -> Self {
        State {
            mode: GameMode::Menu,
        }
    }
    fn play(&mut self, ctx: &mut BTerm) {
        // TODO: Fill this in stub later
        self.mode = GameMode::End;
    }
    fn restart(&mut self) {
        self.mode = GameMode::Playing;
    }

    fn main_menu(&mut self, ctx: &mut BTerm) {
        ctx.cls();
        ctx.print_centered(5, "Welcome to Flappy Dragon");
        ctx.print_centered(8, "(P) Play Game");
        ctx.print_centered(9, "(Q) Quit Game");
        if let Some(key) = ctx.key {
            match key {
                VirtualKeyCode::P => self.restart(),
                VirtualKeyCode::Q => ctx.quitting = true,
                _ => {}
            }
        }
    }

    fn dead(&mut self, ctx: &mut BTerm) {
        ctx.cls();
        ctx.print_centered(5, "You're dead!");
        ctx.print_centered(8, "(P) Play again");
        ctx.print_centered(9, "(Q) Quit Game");

        if let Some(key) = ctx.key {
            match key {
                VirtualKeyCode::P => self.restart(),
                VirtualKeyCode::Q => ctx.quitting = true,
                _ => {}
            }
        }
    }
}

impl GameState for State {
    fn tick(&mut self, ctx: &mut BTerm) {
        match self.mode {
            GameMode::Menu => self.main_menu(ctx),
            GameMode::End => self.dead(ctx),
            GameMode::Playing => self.play(ctx),
        }
    }
}

fn main() -> BError {
    let context = BTermBuilder::simple80x50()
        .with_title("Flappy Dragon")
        .build()?;

    main_loop(context, State::new())
}

```

# Create player

1. First create a Player structure

```rust
struct Player {
    x: i32,
    y: i32,
    velocity: f32,
}
```

2. Create a player implementation with the respective actions. The player will be rendered as a yellow @ symbol, starting at the top left corner. Gravity makes the player go downwards (positive y direction) and the player can flap its wings to go upwards.

```rust
// implement player, location, actions
impl Player {
    fn new(x: i32, y: i32) -> Self {
        Player {
            x,
            y,
            velocity: 0.0,
        }
    }

    // render a player as a yellow @ symbol
    fn render(&mut self, ctx: &mut BTerm) {
        ctx.set(0, self.y, YELLOW, BLACK, to_cp437('@'));
    }

    // add downwards gravity (note that the coordinate system - downwards=positive y-axis)
    fn gravity_and_move(&mut self) {
        if self.velocity < 2.0 {
            self.velocity += 0.2;
        }
        self.y += self.velocity as i32;
        self.x += 1;

        if self.y < 0 {
            self.y = 0;
        }
    }

    // flap wings - feature to make the dragon fly when pressing the space bar
    fn flap(&mut self) {
        self.velocity = -2.0;
    }
}
```

3. Edit game state to account for player. First by adding a player to the state structure

```rust 
struct State {
    // addition after player was added
    player: Player,
    frame_time: f32,
    mode: GameMode,
}
```

4. Add the player in the game State implementation 

```rust
impl State {
    fn new() -> Self {
        State {
            player: Player::new(5, 25),
            frame_time: 0.0,
            mode: GameMode::Menu,
        }
    }
    [...]
}
```

5. Edit the play function so that the background color is set to Navy Blue, the frame_duration is set through constants, and the player is affected by gravity. Furthermore assign the space key to work to trigger the flap function, and if the player hits the Screen hight, the game ends.

```rust
    fn play(&mut self, ctx: &mut BTerm) {
        // addition after player was added
        ctx.cls_bg(NAVY);
        self.frame_time += ctx.frame_time_ms;
        if self.frame_time > FRAME_DURATION {
            self.frame_time = 0.0;
            self.player.gravity_and_move();
        }

        if let Some(VirtualKeyCode::Space) = ctx.key {
            self.player.flap();
        }
        self.player.render(ctx);
        ctx.print(0, 0, "Press Space to Flap.");
        if self.player.y > SCREEN_HEIGHT {
            self.mode = GameMode::End
        }
    }
```

6. Edit restart function to allow the player to restart at a fixed position
```rust
    fn restart(&mut self) {
        // addition after player was added
        self.player = Player::new(5, 25);
        self.frame_time = 0.0;
        self.mode = GameMode::Playing;
    }
```

7. Set constant screen size and frame time values

```rust
// constant definitions of screen size
const SCREEN_WIDTH: i32 = 80;
const SCREEN_HEIGHT: i32 = 50;
const FRAME_DURATION: f32 = 75.0;
```

# Solution

```rust
use bracket_lib::prelude::*;

// constant definitions of screen size
const SCREEN_WIDTH: i32 = 80;
const SCREEN_HEIGHT: i32 = 50;
const FRAME_DURATION: f32 = 75.0;

// create player structure
struct Player {
    x: i32,
    y: i32,
    velocity: f32,
}

// implement player, location, actions
impl Player {
    fn new(x: i32, y: i32) -> Self {
        Player {
            x,
            y,
            velocity: 0.0,
        }
    }

    // render a player as a yellow @ symbol
    fn render(&mut self, ctx: &mut BTerm) {
        ctx.set(0, self.y, YELLOW, BLACK, to_cp437('@'));
    }

    // add downwards gravity (note that the coordinate system - downwards=positive y-axis)
    fn gravity_and_move(&mut self) {
        if self.velocity < 2.0 {
            self.velocity += 0.2;
        }
        self.y += self.velocity as i32;
        self.x += 1;

        if self.y < 0 {
            self.y = 0;
        }
    }

    // flap wings - feature to make the dragon fly when pressing the space bar
    fn flap(&mut self) {
        self.velocity = -2.0;
    }
}

// note that from here onwards there are edits on the game mode
// to account for the player

enum GameMode {
    Menu,
    Playing,
    End,
}

struct State {
    // addition after player was added
    player: Player,
    frame_time: f32,
    mode: GameMode,
}

impl State {
    fn new() -> Self {
        State {
            player: Player::new(5, 25),
            frame_time: 0.0,
            mode: GameMode::Menu,
        }
    }
    fn play(&mut self, ctx: &mut BTerm) {
        // addition after player was added
        ctx.cls_bg(NAVY);
        self.frame_time += ctx.frame_time_ms;
        if self.frame_time > FRAME_DURATION {
            self.frame_time = 0.0;
            self.player.gravity_and_move();
        }

        if let Some(VirtualKeyCode::Space) = ctx.key {
            self.player.flap();
        }
        self.player.render(ctx);
        ctx.print(0, 0, "Press Space to Flap.");
        if self.player.y > SCREEN_HEIGHT {
            self.mode = GameMode::End
        }
    }
    fn restart(&mut self) {
        // addition after player was added
        self.player = Player::new(5, 25);
        self.frame_time = 0.0;
        self.mode = GameMode::Playing;
    }

    fn main_menu(&mut self, ctx: &mut BTerm) {
        ctx.cls();
        ctx.print_centered(5, "Welcome to Flappy Dragon");
        ctx.print_centered(8, "(P) Play Game");
        ctx.print_centered(9, "(Q) Quit Game");
        if let Some(key) = ctx.key {
            match key {
                VirtualKeyCode::P => self.restart(),
                VirtualKeyCode::Q => ctx.quitting = true,
                _ => {}
            }
        }
    }

    fn dead(&mut self, ctx: &mut BTerm) {
        ctx.cls();
        ctx.print_centered(5, "You're dead!");
        ctx.print_centered(8, "(P) Play again");
        ctx.print_centered(9, "(Q) Quit Game");

        if let Some(key) = ctx.key {
            match key {
                VirtualKeyCode::P => self.restart(),
                VirtualKeyCode::Q => ctx.quitting = true,
                _ => {}
            }
        }
    }
}

impl GameState for State {
    fn tick(&mut self, ctx: &mut BTerm) {
        match self.mode {
            GameMode::Menu => self.main_menu(ctx),
            GameMode::End => self.dead(ctx),
            GameMode::Playing => self.play(ctx),
        }
    }
}

fn main() -> BError {
    let context = BTermBuilder::simple80x50()
        .with_title("Flappy Dragon")
        .build()?;

    main_loop(context, State::new())
}

```