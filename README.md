# ⚙️ C Compiler Project

A basic C Compiler built from scratch that demonstrates the fundamental phases of compilation, including lexical analysis, syntax analysis, and intermediate code generation.

---

## ✨ Features

- 🧾 Lexical Analysis using a custom lexer  
- 📐 Syntax Analysis with parser implementation  
- 🏗️ Intermediate Code Generation  
- ✅ Error detection and reporting  
- 🖥️ Command-line based compilation workflow  
- 🔍 Token parsing and grammar validation  

---

## 🛠️ Technologies Used

- C Language  
- Lex & Yacc / Flex & Bison  
- GCC (GNU Compiler Collection)  
- Windows/Linux Terminal  

---

## 📍 The Process

This project was built to understand how compilers work behind the scenes. Instead of only studying compiler design theoretically, I wanted to implement the core phases myself. I started by creating a lexical analyzer to tokenize C source code, then implemented syntax analysis using parsing rules and grammar validation. After building the parser, I added intermediate code generation and error handling to simulate the compilation process more realistically. The project helped me gain a deeper understanding of language processing, parsing techniques, and compiler architecture.

---

## 🚦 How to Run

### Step 1: Generate Compiler Files

```bash
lex lexer.l
yacc -d parser.y
gcc y.tab.c lex.yy.c -o compiler
```

### Step 2: Run the Compiler

```bash
./compiler < test.c
```

Replace `test.c` with your own C source file.

💡 Make sure `flex` and `bison` are installed before running the project.
