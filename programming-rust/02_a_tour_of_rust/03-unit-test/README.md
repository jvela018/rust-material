# Unit tests

- Rust has simple support for testing built into the language.
- For unit testing all you need to do is use the __#[test]__ attribute definition followed by the testing function

- Let's use the gcd example

```rust
#[test]
fn test_gcd() {
    assert_eq!(gcd(14, 15), 1);
}
```

- The test will only run as long as you're running tests and will not be run in the build context
```bash
cargo test
```
