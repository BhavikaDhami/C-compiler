⚙️ C Compiler Project

This project is a basic **C Compiler** built from scratch. It demonstrates the core phases of compilation, including **lexical analysis**, **syntax analysis**, and **code generation**.

---

## 📌 Project Highlights

- 🧾 Lexical Analyzer (Lexer)
- 📐 Syntax Analyzer (Parser)
- 🏗️ Intermediate Code Generation
- ✅ Error detection and reporting
- 🖥️ Command-line interface for compiling C programs

---

## 🛠️ Technologies Used

- C Language
- Lex and Yacc / Flex and Bison *(if applicable)*
- GCC (GNU Compiler Collection)
- Windows/Linux Terminal

---

🧪 How to Run

### Step 1: Compile using Lex and Yacc

lex lexer.l
yacc -d parser.y
gcc y.tab.c lex.yy.c -o compiler

Step 2: Run the Compiler

./compiler < test.c

Replace test.c with your own C source file.

💡 Make sure flex and bison are installed if you're using them.

✨ Author
Bhavika Dhami
🔗 GitHub
