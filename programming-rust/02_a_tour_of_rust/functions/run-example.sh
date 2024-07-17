#!/bin/bash

PROJECT_NAME="functions"

# Create Rust project using cargo new
echo "-------------------------------------------------------"
echo "Creating new Rust project"
echo "-------------------------------------------------------"
echo "command: cargo new $PROJECT_NAME"
cargo new $PROJECT_NAME
echo "'$PROJECT_NAME' directory was created"
echo "-------------------------------------------------------"

echo "-------------------------------------------------------"
echo "Switch directories into Rust project"
echo "-------------------------------------------------------"
echo "command: cd $PROJECT_NAME"
cd $PROJECT_NAME

echo "---------------------------------------------------------------"
echo "Edit main.rs to include the greater common denominator function"
echo "---------------------------------------------------------------"
echo "fn gcd(mut n: u64, mut m: u64) -> u64 {
    assert!(n != 0 && m != 0);
    while m != 0 {
        if m < n {
            let t = m;
            m = n;
            n = t;
        }
        m = m % n;
    }
    n
}

fn main(){
    println!(\"The greater common demominator between 23 and 81 is {}\",gcd(23,81));
}

" > src/main.rs
cat src/main.rs

echo "---------------------------------------------------------------"
echo "Run the example"
echo "---------------------------------------------------------------"
echo "command: cargo run"
cargo run

echo "---------------------------------------------------------------"
echo "This is the end of $PROJECT_NAME"
echo "---------------------------------------------------------------"






