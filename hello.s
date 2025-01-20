.align 4
.arch armv8-a

.global _main
_main:
    // print hello message to stdout
    MOV X0, #1      // put file descriptor (1 for stdout) into X0
    ADR X1, hello   // load address of string into X1
    MOV X2, #15     // put length of string into X2
    MOV X16, #4     // put write syscall number (4) into X16
    SVC 0x0         // make write syscall

    // print goodbye message to stderr
    MOV X0, #2      // put file descriptor (2 for stderr) into X0
    ADR X1, goodbye // load address of string into X1
    MOV X2, #17     // put length of string into X2
    MOV X16, #4     // put write syscall number (4) into X16
    SVC 0x0         // make write syscall

    // exit cleanly
    MOV X0, #0   // put exit code (0) into X0
    MOV X16, #1  // put exit syscall number (1) into X16
    SVC 0x0      // make exit syscall

    // a sentinel string I can spot in the disasm
    .word 0xCCCCCCCC


hello:  .asciz "Hello, World!!\n"
goodbye:  .asciz "Goodbye, World!!\n"