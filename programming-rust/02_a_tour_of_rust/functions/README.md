# Functions syntax


This book uses the greatest common divisor function as an example to explain function sytax.

Let us look at the function

```rust
fn gcd(mut n: u64, mut m: u64) -> u64 {
    assert!(n != 0 && m!=0);
    while m != 0 {
        if m < n {
            let t = m;
            m = n;
            n = t;
        }
        m= = m % n;
    }
    n
}
```

The syntax is pretty similar to other languages. Let's point out the main differences

- __fn__ (pronounced "fun") introduces a function
- The token __->__ precedes the return type
- The type __u64__ is an unsigned 64-bit integer. This shows the syntax of types are tied to their type and size.
- __mut__ (pronounced "mute") allows variables to change - be mutable
- __assert!__ is similar to the assert macro in C. Note that in Rust, macro's have an exclamation mark ! at the end of the invocation.
- __let__ declares a local variable. Note that you can explicitly write a local variable. For example __let t: u64 = m;__ 
- The return value, is the value without a colon at the end of the line. In this case __n__


