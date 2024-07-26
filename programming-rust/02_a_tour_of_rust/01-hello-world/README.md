# Hello World

This section covers Rust's hello world example.
You can either manually follow the steps laid out down below, or simply run the run-example.sh script

```bash
./run-example.sh
```

If the script doesn't run, check the file permissions and make sure that it can be executed. If not run the following command and try again

```bash
chmod +x run-example.sh
```

If you want to remove everything, you can use the clean.sh script to clean up the directory
```bash
./clean-example.sh
```

## Steps to create a Hello World example

- After installing Rust (https://www.rust-lang.org/tools/install) 
- Create a new Rust project using cargo

```bash
cargo new hello
```

- Change directories into the new project - hello

```bash
cd hello
```

- List everything inside the directory

```bash
ls -la
```

- You'll notice that there's a .git .gitignore directory by default, making it easier to version control. __NOTE THAT THIS WILL ONLY HAPPEN IF YOU'RE NOT IN A .git PROJECT ALREADY. TRY THIS OUTSIDE OF THIS REPO__ 
- There's also a file called Cargo.toml, which contains the metadata for packages.

- There's a basic src directory containing the main template

- Open src/main.rs and you'll see the hello world example

- Run the hello world example using cargo

```bash
cargo run
```

- Cargo invokes the RUst compiler, rustc, and then runs the executable produced

- The executable is placed under the target subdirectory at the top of the package target/debug

- You can clean the project by using clean

```bash
cargo clean
```
