# Chapter 1: Systems Programmers Can Have Nice Things

Before we start, it is important to note that the focus on this course is to teach the basics of the Rust language, however this is not a programming class. Let's get started!

## Rust basic information

- Rust is a language for systems programming
- Systems programming is  __Resource Constrained__
    - Every byte counts
    - Every very CPU cycle counts
- The amount of system code involved in supporting a basic app is increasing!


## Where does Rust fit in?

Systems programming is everywhere. Imagine a laptop, you close it, the operating system detects this action and suspends all running programs and turns off the screen, and puts the laptop to sleep. If you open it, you're back to where you left off ...

- There are plenty of topics where Rust can be useful:

    - Operating Systems
    - Device Drivers
    - Filesystems
    - Databases
    - Cryptography
    - Media Processing (e.g., speech recognition, photo editing software)
    - Memory Management (e.g., implementing a garbage collector)
    - Text Rendering (e.g., conversion of text and fonts into pixels)
    - Networking
    - Virtualization and software containers
    - Scientific Simulations
    - Games
    - and more ...


## Let us start with an example

What does this C program do?
__ THIS EXAMPLE IS SUPPOSED TO GIVE DIFFERENT ERRORS IN DIFFERENT MACHINES BUT IT SEEMS LIKE IT DOES THE SAME THING ON MINE  __ 

```c
int main (int argc, char **argv){
    unsigned long a[1];
    a[3] = 0x7ffff7b36cebUL;
    return 0;
}
```
Instead of using the example from the book, I'm using this example https://gist.github.com/piaoger/46c1096319fcba07461c4c1cfb2dcaa5. Note that case 4, is exactly the same as the one from the book.

__ I'M BUILDING IT USING __

```bash
gcc -o memory-unsafety memory-unsafety.c
```


## Some examples on why Rust's popularity has increased - and will continue to increase

### From C/C++ to Rust?

- Case f4 of the previous example is flawed. THe array __a__ is only one element long, so using a[3] is, according to the C programming language standard, undefined behavior
    
    - Undefined Bahavior, upon use of a nonportable or erroneus program construct or of erroneous data, for which this International Standard imposes no requirements (__DOUBLE CHECK THIS__)

- Undefined behavior is not only leads to unpredicatble behavior but the standard explicitly allows the program to do anything at all. 

- C and C++ have hundreds of rules for avoiding undefined behavior. They're mostly common sense:
    - Don't access memory you shouldn't
    - Don't let arithmetic operations overflow
    - Don't divide by zero, etc.

- The compiler doesn't enforce these rules; it has no obligation to detect even blatant violations.

- In our example - f4 compiles without errors or warnigns. The responsibility falls entirely on the programmer.

- Sure, your C/C++ compiler to make programs they translate report undefined behavior, but can you capture every single one, for every single project?

- Some issues might just show as a strange message or crash related to a quality issue, but inadvertently undefined behavior has also been a major cause of security flaws as it propagates from one computer to other as shown in 1988 by Worm's variation technique.

- Can we do any better?

- The Rust language makes you a simple promise: if your program passes the compiler's checks, it is free of undefined behavior. 

- Dangling pointers, double-frees and null pointer dereferences are all caught at compile time. 

- Array references are secured with a mix of compile-time and run-time checks, so there are no buffer overruns - the equivalent in Rust exits safely with an error message.

- How does Rust do this? By imposing more restrictions on your code than C and C++ do. 

- By being able to trust the language to catch more mistakes, we're encouraged to try more ambitious projects. Modifying large, complex programs is less risky when you know that issues of memory management and pointer validity are taken care of.

- Of course, there are still plenty of bugs that Rust cannot detect. But in practice, taking undefined behavior off the table substatially changes the cahracter of development for the better.

- Concurrency is notoriously difficult to use correctly in C and C++, and in modern times parallelism is too important to modern machines to treat them as a method of last resort. 

- Note that some of the same restrictions that ensure memory safety in Rust, also ensure that Rust programs are free of data races. 

- Hence, Rust is an excellent language to explode the abilities of modern multicore machines.

- And yet Rust is still fast. But what does that mean? One can write slow code in any general-purpose language. IT would be more precise to say that, if you're ready to make the investment to design your program to make the best use of the underlying machine's capabilities, Rust supports you in that effort. The language is designed with efficient defaults and gives you the ability to control how memory gets used and how the processor's attention is spent.

- Last but not least, Rust makes collaboration easier. Rust's package manager and build tool, Cargo, makes it easy to use libraries published by others on Rust's public package repository, the crates.io website. Cargo takes care of downloading libraries together with whatever otehr libraries it uses in turn, and linking the whole lot together. IT's teh answer to NPM or RubiGems with emphasis on soud version management and reproducible builds.
