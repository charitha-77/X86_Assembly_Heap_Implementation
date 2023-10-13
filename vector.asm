extern realloc
extern free
; extern malloc
extern printf

section .data

format db "Value of register: %ld", 10, 0
format_len equ $ - format

hello db 'Hello, World!',0 ; Null-terminated string

section .text
global init_v
global delete_v
global resize_v
global get_element_v
global push_v
global pop_v
global size_v

init_v:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ;ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov qword [rdi], 0x0     ; Set the capacity field of the vector to 0
        mov qword [rdi + 8], 0x0 ; Set the size field of the vector to 0
        mov qword [rdi + 16], 0x0 ; Set the data field of the vector to 0 
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

delete_v:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov rbx, [rdi + 16]  ; Load the data field (assuming its a pointer)
        cmp rbx, 0x0        ; Check if the data pointer is null
        je .no_data_dealloc   ; If null, jump to skip data deallocation
        push rdi 
        mov rdi, rbx              ; Save the data pointer for deallocation
        call free            ; Deallocate the data memory ;clean push
        pop rdi
        mov qword [rdi+16], 0x0
.no_data_dealloc:
        mov qword [rdi], 0x0
        mov qword [rdi+8], 0x0
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

resize_v:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        push rdi
        push rsi
        mov rdi, [rdi+16]       ;Save the new size
        imul rsi, 8            ;Save the vector pointer
        call realloc
        pop rsi
        pop rdi
        mov [rdi], rsi
        mov [rdi+16], rax     ;Call a function to realloc (replace with your allocation logic)         ;Adjust the stack after the call
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

get_element_v:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov rbx, [rdi+16]
        mov rcx, rsi
        imul rcx, 8
        add rbx, rcx
        mov rax, rbx
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

push_v:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov r9, [rdi]    ;r9=capacity
        mov rdx, [rdi+16];rdx = pointer to base
        mov rcx, [rdi+8] ;rcx=size
        mov r15, rcx    
        imul r15, 2
        add r15, 1       ;r15=2*size+1
        cmp r9, rcx ;comapre capacity and size
        jle .do_resize_v  ;if capacity less than or equal to size
        jmp .no_resize
.do_resize_v:
        push rdi
        push rsi
        mov rsi, r15
        call resize_v
        pop rsi
        pop rdi
        mov rcx, [rdi+8]
        shl rcx, 3 ;rcx=8*size
        mov rdx, [rdi+16]
        add rdx, rcx;rdx=address of arr[size]
        mov [rdx], rsi
        add QWORD[rdi+8], 1
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret
.no_resize:
        mov rcx, [rdi+8]  ;rcx=size
        imul rcx, 8   ;rcx=4*size
        add rdx, rcx  ;rdx=address of arr[size]
        mov [rdx], rsi
        add QWORD[rdi+8], 1
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

pop_v:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        call size_v
        sub rax, 1
        imul rax, 8
        mov rdx, [rdi+16]
        add rdx, rax
        mov rax, [rdx]
        sub QWORD [rdi+8], 1
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

size_v:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov rax, [rdi+8]
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret
