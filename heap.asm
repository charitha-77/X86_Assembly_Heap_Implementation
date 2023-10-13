extern init_v
extern pop_v
extern push_v
extern size_v
extern get_element_v
extern resize_v
extern delete_v

extern printf

section .data

format db "Value of register: %ld", 10, 0
format_len equ $ - format

hello db 'Hello, World!',0 ; Null-terminated string


section .text
global init_h
global delete_h
global size_h
global insert_h
global get_max
global pop_max
global heapify
global heapsort
; global swap_left_parent
; global swap_right_parent
; global heapify_old 

; swap_right_parent:
;         push rbp
;         mov rbp, rsp
;         push rax
;         push rbx
;         push rcx
;         push rdx
;         push r8
;         push r9
;         push r10
;         push r11
;         push r12
;         push r13
;         push r14
;         push r15
;         ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
;         mov r15, rcx   ;r15=i
;         mov r14,rcx    ;r14=i
;         imul r15,4   ;r15=4*i
;         mov r13, [rdi+16]   ;r13=arr
;         mov r12, r13
;         add r13, r15  ;r13=arr[i]
;         mov [r13], rsi
;         imul r14, 2  ;r14=2*i
;         add r14, 2   ;r14=2*i+2
;         imul r14, 4
;         add r12, r14
;         mov [r12], rdx
;         pop r15
;         pop r14
;         pop r13
;         pop r12
;         pop r11
;         pop r10
;         pop r9
;         pop r8
;         pop rdx
;         pop rcx
;         pop rbx
;         pop rax
;         mov rsp, rbp
;         pop rbp
;         ret
       

; swap_left_parent:
;         push rbp
;         mov rbp, rsp
;         push rax
;         push rbx
;         push rcx
;         push rdx
;         push r8
;         push r9
;         push r10
;         push r11
;         push r12
;         push r13
;         push r14
;         push r15
;         ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
;         mov r15, rcx   ;r15=i
;         mov r14,rcx    ;r14=i
;         imul r15,4   ;r15=4*i
;         mov r13, [rdi+16]   ;r13=arr
;         mov r12, r13
;         add r13, r15  ;r13=arr[i]
;         mov [r13], r9
;         imul r14, 2  ;r14=2*i
;         add r14, 1   ;r14=2*i+1
;         imul r14, 4
;         add r12, r14
;         mov [r12], r8
;         pop r15
;         pop r14
;         pop r13
;         pop r12
;         pop r11
;         pop r10
;         pop r9
;         pop r8
;         pop rdx
;         pop rcx
;         pop rbx
;         mov rsp, rbp
;         pop rbp
;         ret

; no_left:
;       ret
; is_left_no_right:
;       mov rsi, r9  ;rdi=left_element
;       mov rdx, r8  ;rsi=parent_element
;       mov rcx, r11
;       ;mov r8, r12
;       cmp r9, r8
;       ja swap_left_parent
;       ret

; left_largest:
;       mov rsi, r9  ;rdi=left_element
;       mov rdx, r8  ;rsi=parent_element
;       mov rcx, r11
;       cmp r9, r8
;       ja swap_left_parent
;       ret

; heapify_old:
;         push rbp
;         mov rbp, rsp
;         push rax
;         push rbx
;         push rcx
;         push rdx
;         push r8
;         push r9
;         push r10
;         push r11
;         push r12
;         push r13
;         push r14
;         push r15
;         ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
;         mov rax, rdi
;         mov rcx, [rax+8]  ;rcx=size
;         add rbx, rsi  ;rbx=i
;         mov r11, rbx   ;r11=i
;         mov rsi, rbx
;         call get_element_v
;         mov r8, rax   ;r8=arr[i]
;         imul rbx, 2 ;rbx=2*i
;         add rbx, 1  ;rbx=2*i+1
;         mov r12, rbx  ;r12=left
;         cmp rbx, rcx 
;         jae no_left 
;         mov rsi, rbx
;         call get_element_v
;         mov r9, rax   ;r9=arr[2i+1]
;         add rbx, 1    ;rbx=2*i+2
;         mov r13, rbx  ;r13=right
;         cmp rbx, rcx
;         jae is_left_no_right
;         mov rsi, rbx
;         call get_element_v
;         mov r10, rax   ;r10=arr[2*i+2]
;         cmp r9, r10 
;         ja left_largest
;         mov rsi, r10  ;rsi=lright_element
;         mov rdx, r8  ;rdx=parent_element
;         mov rcx, r11
;         cmp r10, r8
;         ja swap_right_parent
;         pop r15
;         pop r14
;         pop r13
;         pop r12
;         pop r11
;         pop r10
;         pop r9
;         pop r8
;         pop rdx
;         pop rcx
;         pop rbx
;         mov rsp, rbp
;         pop rbp
;         ret



init_h:
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
        call init_v
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

delete_h:
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
        call delete_v
        pop rdi
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


size_h:
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
        ; push rdi
        call size_v
        ; pop rdi
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


insert_h:
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
        call push_v
        sub QWORD [rdi+8], 1
        mov r14, [rdi+8]   ;r14=size
        mov r13, r14       ;r13=i
        
        ; imul r14, 8        ;r14=8*size
        ; add r15, r14       ;address of arr[size]
        ; mov [r15], rsi     ;T[size]=inserting element
main_loop:  
        cmp r13, 0
        jle loop1
        mov r15, [rdi+16]  ;r15=array base address
        mov rdx, r15       ;rdx=array base address
        mov rcx, r15       ;rcx=base address of arr
        mov r12, r13       ;r12=i
        imul r12, 8
        add rdx, r12
        mov r8, [rdx]       ;r8=arr[i]
        sub r13, 1
        shr r13, 1
        imul r13, 8
        add rcx, r13
        mov r9, [rcx]        ;r9=arr[parent(i)]
        cmp r9, r8
        jae loop1
        mov [rdx], r9
        mov [rcx], r8
        shr r13, 3
        jmp main_loop

loop1:
        add QWORD [rdi+8], 1        
        mov r14, [rdi+8]  
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
get_max:
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
        mov rax, [rbx]
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

pop_max:
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
        mov rdx, [rdi+16]
        mov rcx, [rdi+16]
        mov rbx, [rcx]
        cmp QWORD [rdi+8], 0
        je return
        call size_v 
        sub rax, 1
        shl rax, 3
        add rdx, rax
        mov r15, [rdx]
        mov r14, [rcx]
        mov [rdx], r14
        mov [rcx], r15
        ; push rdi
        ; push rsi
        ; mov rdi, format
        ; mov rsi, [rdx]
        ; call printf
        ; pop rsi
        ; pop rdi
;          mov eax, 4          ; syscall number for write
;     mov ebx, 1          ; file descriptor 1 (stdout)
;     mov ecx, hello      ; pointer to the message to print
;     mov edx, 13         ; length of the message

;     ; Invoke the system call
;     int 0x80
        call pop_v
        mov r8, 0x0
loop_pop:
        mov r12, r8
        cmp r8, [rdi+8]    ;r8=i
        jae return
        mov rsi, r8
        call get_element_v
        mov r10, [rax]        ;r10=parent
        mov r9, r12
        imul r9, 2
        add r9, 1
        cmp r9, [rdi+8]  
        jae return 
        mov rsi, r9
        call get_element_v   
        mov r9, [rax]         ;r9=leftchild
        mov r11, r12
        imul r11, 2
        add r11, 2
        cmp r11, [rdi+8]
        jae swap_left
        mov rsi, r11
        call get_element_v
        mov r11, [rax]        ;r11=rightchild
        cmp r11, r9
        jae swap_right
        jmp swap_left
swap_right:
        cmp r11, r10
        jle return
        mov rdx, [rdi+16]
        mov rcx, rdx
        imul r8, 8
        add rdx, r8
        mov [rdx], r11
        imul r8, 2
        add r8, 16
        add rcx, r8
        mov [rcx], r10
        shr r8, 3
        jmp loop_pop
swap_left:
        cmp r9, r10
        jle return
        mov rdx, [rdi+16]
        mov rcx, rdx
        imul r8, 8
        add rdx, r8
        mov [rdx], r9
        imul r8, 2
        add r8, 8
        add rcx, r8
        mov [rcx], r10
        shr r8, 3
        jmp loop_pop
return:
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

heapify:
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
;         mov rax, rdi
;         mov r15, [rdi+8]
;         add r15, -1
; loop:
;         mov rsi, r15
;         call heapify_old
;         dec r15
;         cmp r15, 0x0
;         jae loop
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

heapsort:
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
;         mov r12, [rdi+16]
;         mov r8, 0
; loop2:
;         cmp r8,[rdi+8]
;         je allocate
;         ; call init_h
;         mov rsi, [r12]
;         call insert_h
;         add r12, 8
;         add r8, 1
;         jmp loop2
; allocate:
; ;  mov eax, 4          ; syscall number for write
; ;     mov ebx, 1          ; file descriptor 1 (stdout)
; ;     mov ecx, hello      ; pointer to the message to print
; ;     mov edx, 13         ; length of the message

; ;     ; Invoke the system call
; ;     int 0x80
;         mov r12, [rdi+16]
;         mov r8, 0
;         call init_h
        
; sorting:
;         cmp r8, [rdi+8]
;         je return_pop
;         call pop_max
;         mov [r12], rax
;         add r12, 8
;         add r8, 1
;         jmp sorting

; return_pop:
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
