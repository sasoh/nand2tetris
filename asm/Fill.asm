// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(POLLKEYBOARD)
    @8192
    D=A
    @R0
    M=D

    @i
    M=0

    @KBD
    D=M
    @FILLWHITE
    D;JEQ
    @FILLBLACK
    0;JMP

(FILLBLACK)
    @i
    D=M
    @R0
    D=D-M
    @END
    D;JEQ

    @SCREEN
    D=A
    @i
    A=D+M
    M=-1

    @i
    M=M+1

    @FILLBLACK
    0;JMP

(FILLWHITE)
    @i
    D=M
    @R0
    D=D-M
    @END
    D;JEQ

    @SCREEN
    D=A
    @i
    A=D+M
    M=0

    @i
    M=M+1

    @FILLWHITE
    0;JMP

(END)
    @POLLKEYBOARD
    0;JMP