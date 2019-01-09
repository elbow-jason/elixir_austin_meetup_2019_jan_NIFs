# NIFs in Rust (using Rustler)

## TODOs:
  - [ ] write steps for project setup
  - [ ] add simple example app
  - [ ] add simple resource app

### What is Rust?:

  - A statically-type, type-safe, memory-safe, data race free systems programming language that is nearly as fast C/C++.
  - A language that compiles to a native, statically-linked binary.
  - Totally Open-Source.
  - Developed my Mozilla.
  - A community as beginner friendly as Elixir's.

### Why Rust for Elixir:

  - Rustler, a lib for building Rust NIFs, is an amazing tool.
  - Rust offers mutability and speed without endangering the VM.
  - Rust offers a Elixir's-mix-type utility called `cargo` for build, deps, testing, etc.
  - Use of arbitrary Rust libs (many many many)
  - Usually things "just work".
  - Speed.

### Why Not Rust?:

  - If you are a master at C/C++...
  - If you do not need thread-safety...
  - If you need a "quick prototype"...

### Nothing is free:

  - Rust is not an "easy" language.
  - crossing the VM/Native boundary is not free (~20 microseconds of overhead per call on my MacBookPro)

### How does a NIF work from the Elixir/Erlang side?:

  - use Ruster
  - define functions
  - :erlang.nif_error/1

### Getting to know Rust:

  - briefly explain ownership. Give resources to learn more.
  - read this: `Env<'a>`
  - read this: `NifResult<Term<'a>>`

### How does a NIF work from the native side?:

  - explain `extern crate`s
  - explain `rustler_atoms!`
  - explain `rustler_export_nifs!`
  - explain arg 0: `env: Env<'a>`
  - explain arg 1: `args: &[Term<'a>]`
  - explain return type `NifResult<Term<'a>>` 

### Demo Project:

  - show code generation
  - setup simplest app
  - show simplest example (a pure function with scalar inputs (add/2?)) 
  - show a stateful resource (`on_load`, `ArcResource`, `unwrapping`, Reference type in erlang) (no code just show)
