#!/bin/bash

PROJECT_NAME="hello"

# Create Rust project using cargo new
echo "-------------------------------------------------------"
echo "Creating new Rust project"
echo "-------------------------------------------------------"
echo "command: cargo new $PROJECT_NAME"
cargo new $PROJECT_NAME
echo "'$PROJECT_NAME' directory was created"
echo "-------------------------------------------------------"

echo "-------------------------------------------------------"
echo "Explore the contents of the newly created Rust Project"
echo "-------------------------------------------------------"
echo "Let's move into '$PROJECT_NAME' and list its contents"
echo "command: cd $PROJECT_NAME && ls -al"
cd $PROJECT_NAME && ls -al
echo "There should be 2 files/directories: src/ and Cargo.toml"
echo "If you do this outside of this repository also a .git and gitignore will be created!"
echo "-------------------------------------------------------------------------------------"

echo "-------------------------------------------------------"
echo "Explore the Cargo.toml file"
echo "-------------------------------------------------------"
echo "This file contains the metadata of the packages"
echo "and versions used in the project"
echo "Let's print the content of the file onto the console\n"
echo "command: cat Cargo.toml"
cat Cargo.toml

echo "-------------------------------------------------------"
echo "Explore the src/ directory and the main.rs template"
echo "-------------------------------------------------------"
echo "command: ls -al src/"
ls -al src/
echo ""
echo "Let's print the contents of main.rs onto the console"
echo "command: cat src/main.rs"
cat src/main.rs
echo

echo "-------------------------------------------------------"
echo "Let's run the Hello world example by using cargo run"
echo "-------------------------------------------------------"
echo "Note that you need to run this command from the top directory $PROJECT_NAME"
echo "as it will call the Cargo.toml file and source files"
echo "command: cargo run"
cargo run
echo ""
echo "Hello world should've popped up on your console"

echo "-------------------------------------------------------"
echo "What happened?"
echo "-------------------------------------------------------"
echo "cargo run called the compiler rustc and built the project"
echo "and stored it under target/debug and ran the executable hello"
echo "Let's list the items in the current directory once again"
echo "command: ls -al"
ls -al
echo "you should see a new directory called target - where the binary is stored"
echo ""

echo "If you want to clean the project you can use clean"
echo "cargo clean"
echo "You have finalized Rust's Hello World example"
echo ""

