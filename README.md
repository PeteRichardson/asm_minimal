# asm_minimal

Minimal arm64 asm program to print hello and goodbye. 

If radare2 is installed, 'make disasm' will print a nice
disassembly. (e.g. see below...)

```arm
            ;-- section.0.__TEXT.__text:
            ;-- entry0:
            ;-- _main:
            ;-- func.1000002e0:
            ;-- pc:
            ; NULL XREF from aav.0x100000020 @ +0xb0(r)
┌ 56: int main (int argc, char **argv, char **envp);
│           0x1000002e0      200080d2       mov x0, 1                  ; [00] -r-x section size 90 named 0.__TEXT.__text
│           0x1000002e4      a1010010       adr x1, sym.hello          ; sym.func.100000318
│                                                                      ; 0x100000318
│           0x1000002e8      e20180d2       mov x2, 0xf
│           0x1000002ec      900080d2       mov x16, 4
│           ;-- syscall.write:
│           ;-- syscall.write.1:
│           0x1000002f0      010000d4       svc 0
│           0x1000002f4      400080d2       mov x0, 2
│           0x1000002f8      81010010       adr x1, sym.goodbye        ; sym.func.100000328
│                                                                      ; 0x100000328
│           0x1000002fc      220280d2       mov x2, 0x11
│           0x100000300      900080d2       mov x16, 4
│           ;-- syscall.write.0:
│           ;-- syscall.write.2:
│           0x100000304      010000d4       svc 0
│           0x100000308      000080d2       mov x0, 0
│           0x10000030c      300080d2       mov x16, 1
│           ;-- syscall.exit:
│           ;-- syscall.exit.0:
│           0x100000310      010000d4       svc 0
└           0x100000314      cccccccc       invalid
- offset -   1819 1A1B 1C1D 1E1F 2021 2223 2425 2627  89ABCDEF01234567
0x100000318  4865 6c6c 6f2c 2057 6f72 6c64 2121 0a00  Hello, World!!..
0x100000328  476f 6f64 6279 652c 2057 6f72 6c64 2121  Goodbye, World!!
```