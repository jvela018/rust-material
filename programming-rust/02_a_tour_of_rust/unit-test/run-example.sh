#!/bin/bash

PROJECT_NAME="unit-testing"

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

" > src/main.rs
cat src/main.rs

echo "---------------------------------------------------------------"
echo "Edit main.rs to include unit test"
echo "---------------------------------------------------------------"
echo "#[test]
fn test_gcd() {
    assert_eq!(gcd(14, 15), 1);

    assert_eq!(gcd(2 * 3 * 5 * 11 * 17,
                   3 * 7 * 11 * 13 * 19),
               3 * 11);
}
" >> src/main.rs
cat src/main.rs

echo "---------------------------------------------------------------"
echo "Run unit test"
echo "---------------------------------------------------------------"
echo "command: cargo test"
cargo test

echo "---------------------------------------------------------------"
echo "This is the end of unit test setup"
echo "---------------------------------------------------------------"






