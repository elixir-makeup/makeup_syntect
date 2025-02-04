## x86_64 Assembly Code Example

```assembly_x86_64
; Comprehensive x86_64 Assembly Demo
; Demonstrates various syntax features, directives, and instructions

; Section declarations
section .data
    ; Various data declarations
    msg_hello    db      "Hello, World!", 0x0A, 0    ; String with newline and null terminator
    num1         dq      42                          ; 64-bit integer
    pi           dd      3.14159                     ; 32-bit float
    array        times 5 dd 0                        ; Array of 5 32-bit zeros
    flags        db      0b10101010                  ; Binary notation
    hex_val      dq      0xDEADBEEF                 ; Hexadecimal notation

section .bss
    ; Uninitialized data
    buffer       resb    64                          ; Reserve 64 bytes
    big_array    resq    100                        ; Reserve space for 100 64-bit values

section .text
    global _start                                    ; Entry point declaration

; Constants and macros
%define STDOUT      1
%define SYS_WRITE   1
%define SYS_EXIT    60

; Macro definition
%macro print_string 2
    mov     rax, SYS_WRITE
    mov     rdi, STDOUT
    mov     rsi, %1
    mov     rdx, %2
    syscall
%endmacro

_start:
    ; Function prologue
    push    rbp
    mov     rbp, rsp

    ; Basic arithmetic
    mov     rax, 10
    add     rax, 5                                  ; Addition
    sub     rax, 3                                  ; Subtraction
    imul    rax, 2                                  ; Multiplication

    ; Bitwise operations
    mov     rbx, 0xFF
    and     rbx, 0xF0                              ; AND operation
    or      rbx, 0x0F                              ; OR operation
    xor     rbx, rbx                               ; Clear register

    ; Conditional execution
    cmp     rax, 20
    je      equal_twenty                           ; Jump if equal
    jmp     not_twenty                             ; Unconditional jump

equal_twenty:
    mov     rcx, 1

not_twenty:
    ; Loop example
    mov     rcx, 5                                 ; Counter
loop_start:
    push    rcx                                    ; Save counter
    ; ... loop body ...
    pop     rcx                                    ; Restore counter
    dec     rcx
    jnz     loop_start                            ; Jump if not zero

    ; Stack operations
    push    qword [num1]                          ; Push value to stack
    pop     rax                                   ; Pop value from stack

    ; Memory addressing modes
    mov     rax, [array]                          ; Direct addressing
    mov     rbx, [array + 8]                      ; Base + displacement
    mov     rcx, [array + rax*4]                  ; Base + index*scale

    ; SIMD instruction example (if supported)
    movdqu  xmm0, [array]                         ; Load unaligned 128-bit data

    ; System call example
    print_string msg_hello, 13                    ; Using our macro

    ; Function epilogue and exit
    mov     rsp, rbp
    pop     rbp

    mov     rax, SYS_EXIT                         ; Exit syscall
    xor     rdi, rdi                              ; Return 0
    syscall

; Local function example
local_func:
    push    rbp
    mov     rbp, rsp
    ; Function body
    leave
    ret
```