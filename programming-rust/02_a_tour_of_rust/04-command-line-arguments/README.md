# Chapter 2 : Handling Command-Line Arguments

If you are familiar with Rust you can just run the example using the bash script
```bash
./run-example.sh
```

This section goes over the following piece of code

```rust
use std::env;
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
        numbers.push(u64::from_str(&arg).expect("error parsing argument"));
    }

    if numbers.len() == 0 {
        eprintln!("Usage: gcd Number ...");
        std::process::exit(1);
    }

    let mut d = numbers[0];
    for m in &numbers[1..] {
        d = gcd(d, *m);
    }

    println!("The greatest common divisor of {:?} is {}", numbers, d);
}

```

Note that we're re-using the gcd function from the previous section.

Let's disect the code into 4 parts:

```rust
let mut numbers = Vec::new();
```

- This part of the code sets a mutable (can change) variable, which is of vector type

```rust
    if numbers.len() == 0 {
        eprintln!("Usage: gcd Number ...");
        std::process::exit(1);
    }
```

- This section checks that your vector has any entries and if it doesn't it will print an error message and exit the program with an error 

```rust
let mut d = numbers[0];
    for m in &numbers[1..] {
        d = gcd(d, *m);
    }
```

- If the vector has any entries, you will populate the vector, and then loop through every entry starting from index 1 and storing it back to d, until you passed through all the values
