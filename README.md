# Monkey Interpreter in Nim

A Nim implementation of the Monkey programming language from "Writing An Interpreter In Go" by Thorsten Ball. I'm also working through "Crafting Interpreters" and "Building a Compiler" by Thorsten Ball, so the final product is intended to be a hybrid of Monkey and Lox. I also intend to implement a minimal standard library for practice.

## Aside on Language Choice

Nim was selected as the language for this project due to its ability to handle both high-level garbage-collected code and lower-level manually managed memory. I wanted a language with clean and simple syntax that I could follow and translate from Java, C, and Go, since Thorsten Ball's books use Go and Robert Nystrom's book implements its language in both C and Java.

Rust was my other main candidate, and I may redo this project in Rust in the future, but Rust fails the "clean and simple" syntax requirement and I wanted to focus on the underlying logic as much as possible without having to learn or struggle through Rust specific challenges. C++ was another candidate, but it also fails my basic requirements. Ultimately, Nim was chosen because I found it the simplest to read and translate from other languages without having to think too hard about it, while still being able to do manual memory management.

## Why this project?

I decided to build this project because it's a fundamental computer science skill and I wanted to demystify programming language fundamentals. I also wanted a project that interacts with manual memory management because I haven't touched C or ASM level code since completing my degree and I wanted the practice. This project is also intended to be a precursor to working through SICP. I'm aiming for a thorough coverage of Comp Sci fundamentals

## Overview

Currently only the Lexer is implemented.

```
src/
├── main.nim       # Entry point
├── token/
│   └── token.nim  # Token type definitions
├── lexer/
│   └── lexer.nim  # Lexical analysis
└── repl/
    └── repl.nim   # Interactive REPL
```

## AI Policy

**This project uses AI for feedback and review only. AI does not write, modify, or touch any code.**

All code in this repository is human-written. AI assistance is limited to:
- Code review and style suggestions
- Comparison with other implementations (e.g., Go version)
- General feedback on code quality
- Commit message generation

No AI-generated code is committed to this repository. All implementation decisions, bug fixes, and refactoring are done manually by yours truly.

## License

This is a learning project based on the book "Writing An Interpreter In Go" by Thorsten Ball "Writing a Compiler in Go" by Thorsten Ball and "Crafting Interpreters" by Robert Nystrom.
License = ¯\_(ツ)_/¯
