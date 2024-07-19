# Iron's Hello World Example

- Create new Rust project

```bash
cargo new hello-iron
```

- Change directory into hello-iron/

```bash
cd hello-iron
```
- Add iron crate to Cargo.toml 
```bash
cargo add iron@=0.6.1
```

- Edit src/main.rs to look like this

```rust
use iron::prelude::*;
use iron::status;

fn main() {
    Iron::new(|_: &mut Request| {
        Ok(Response::with((status::Ok, \"Hello Rust World!\")))
    }).http(\"localhost:3000\").unwrap();
}
```
