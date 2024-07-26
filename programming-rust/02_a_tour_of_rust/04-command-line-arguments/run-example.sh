#!/bin/bash

PROJECT_NAME="command-line"

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


echo "-------------------------------------------------------"
echo "Updating src/main.rs to take command line input"
echo "-------------------------------------------------------"
echo "command: echo \"use std::env;
use std::str::FromStr;

fn gcd(mut n: u64, mut m: u64) -> u64 {
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

fn main() {
    let mut numbers = Vec::new();

    for arg in env::args().skip(1) {
        numbers.push(u64::from_str(&arg).expect(\"error parsing argument\"));
    }

    if numbers.len() == 0 {
        eprintln!(\"Usage: gcd Number ...\");
        std::process::exit(1);
    }

    let mut d = numbers[0];
    for m in &numbers[1..] {
        d = gcd(d, *m);
    }

    println!(\"The greatest common divisor of {:?} is {}\", numbers, d);
}
\""

echo "use std::env;
use std::str::FromStr;

fn gcd(mut n: u64, mut m: u64) -> u64 {
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

fn main() {
    let mut numbers = Vec::new();

    for arg in env::args().skip(1) {
        numbers.push(u64::from_str(&arg).expect(\"error parsing argument\"));
    }

    if numbers.len() == 0 {
        eprintln!(\"Usage: gcd Number ...\");
        std::process::exit(1);
    }

    let mut d = numbers[0];
    for m in &numbers[1..] {
        d = gcd(d, *m);
    }

    println!(\"The greatest common divisor of {:?} is {}\", numbers, d);
}
" > src/main.rs


echo "-------------------------------------------------------"
echo "Running the program using 45 and 1509 "
echo "-------------------------------------------------------"
echo "command: cargo run 45 1509"
cargo run 45 1509

echo "-------------------------------------------------------"
echo "Try it yourself. Go into $PROJECT_NAME and play with it!"
echo "-------------------------------------------------------"

