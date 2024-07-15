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


