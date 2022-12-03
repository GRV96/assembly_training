# assembly_training
This is assembly code that I wrote to learn the language.

Before compiling assembly source files, you need to install `nasm`.
```
sudo apt install -y nasm
```

Then, you can create executable files from assembly files with bash script
`compile_asm`. It echoes the executables' name in the console. Example:
```
./compile_asm hello_world.asm
```

The executable files are run as follows.
```
./hello_world
```

`compile_asm` can recieve several assembly files at the same time. Example:
```
./compile_asm hello_world.asm atmosphere.asm
```

Alternatively, you can execute an assembly program without leaving an
executable by using bash script `exec_asm`. This one takes only one argument.
Example:
```
./exec_asm hello_world.asm
```
