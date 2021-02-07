// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// R0 contains filler color (all 0 for white, all 1 for black).
// R1 contains screen position as corresponding address in RAM.
(LOOP)
    // Set D to 0 or 1 depending on if key is pressed.
    @KBD
    D=M
    @SETBLACK
    D;JNE
    @0
    M=0
    @SETEND
    0;JMP
(SETBLACK)
    @0
    M=0
    M=!M
(SETEND)

    // Fill screen with value stored in D.
    @SCREEN
    D=A
    @1
    M=D
(FILL)
    @0
    D=M

    // Unroll loop a bit.
    @1
    A=M
    M=D
    A=A+1
    M=D
    A=A+1
    M=D
    A=A+1
    M=D
    A=A+1
    M=D
    A=A+1
    M=D
    A=A+1
    M=D
    A=A+1
    M=D

    // Adjust screen position.
    @8
    D=A
    @1
    M=M+D

    // Check if next iteration is needed.
    @1
    D=M
    @KBD
    D=D-A
    @LOOP
    D;JEQ

    @FILL
    0;JMP
