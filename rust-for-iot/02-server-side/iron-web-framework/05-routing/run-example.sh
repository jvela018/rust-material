#!/bin/bash

PROJECT_NAME="routing-iron"

# Create Rust project using cargo new
echo "-------------------------------------------------------"
echo "Creating new Rust project"
echo "-------------------------------------------------------"
echo "command: cargo new $PROJECT_NAME"
cargo new $PROJECT_NAME
echo "'$PROJECT_NAME' directory was created"
echo "-------------------------------------------------------"

echo "-------------------------------------------------------"
echo "Moving to $PROJECT_NAME project directory"
echo "-------------------------------------------------------"
echo "command: cd $PROJECT_NAME"
cd $PROJECT_NAME

echo "-------------------------------------------------------"
echo "Add iron crate to project"
echo "-------------------------------------------------------"
echo "command: cargo add iron@=0.6.1"
cargo add iron@=0.6.1

echo "-------------------------------------------------------"
echo "Add router crate to project"
echo "-------------------------------------------------------"
echo "command: cargo add router=0.6.0"
cargo add router@=0.6.0


echo "-------------------------------------------------------"
echo "Editing main.rs to Iron's Hello World example"
echo "-------------------------------------------------------"
echo "command: echo \"use iron::prelude::*;
use iron::status;
use iron::IronError;
use std::io::Read;

fn echo(request: &mut Request) -> IronResult<Response> {
    let mut body = String::new();
    request
        .body
        .read_to_string(&mut body)
        .map_err(|e| IronError::new(e, (status::InternalServerError, \"Error reading request\")))?;
    Ok(Response::with((status::Ok, body)))
}

fn main() {
    Iron::new(echo).http(\"localhost:3000\").unwrap();
}
"
echo "use iron::prelude::*;
use iron::status;
use iron::IronError;
use std::io::Read;

fn echo(request: &mut Request) -> IronResult<Response> {
    let mut body = String::new();
    request
        .body
        .read_to_string(&mut body)
        .map_err(|e| IronError::new(e, (status::InternalServerError, \"Error reading request\")))?;
    Ok(Response::with((status::Ok, body)))
}

fn main() {
    Iron::new(echo).http(\"localhost:3000\").unwrap();
}
" > src/main.rs

echo "Formatting for Rust using cargo fmt"
cargo fmt

echo "-------------------------------------------------------"
echo "Explore src/main.rs"
echo "-------------------------------------------------------"
echo "command: cat src/main.rs"
cat src/main.rs

echo "-------------------------------------------------------"
echo "Run example"
echo "-------------------------------------------------------"
echo "command: cargo run"
cargo run
