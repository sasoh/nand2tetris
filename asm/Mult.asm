// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.
    @R1
    D=M
    @i
    M=D

    @R2
    M=0
(LOOP)
    // if (i == 0) goto STOP
    @i
    D=M
    @STOP
    D;JLE

    // decrease i
    @i
    M=M-1

    // result = result + R0
    @R0
    D=M
    @R2
    M=D+M

    // goto LOOP
    @LOOP
    0;JMP
(END)
    @END
    0;JMP