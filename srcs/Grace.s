%define MAIN() _main: call _prog ; macro main
%define MAC_SYSCALL(x) 0x2000000 | x

segment .data
	filename: db "Grace_kid.s", 0
	beginning: db "%cdefine MAIN() _main: call _prog ; macro main%c%cdefine MAC_SYSCALL(x) 0x2000000 | x%c%csegment .data%c%cfilename: db %c%s%c, 0%c%cbeginning: db %c%s%c, 0%c%cprog: db %c%s%c, 0%c%csegment .text%c%cglobal _main%c%cglobal _prog%c%cextern _dprintf%c%cMAIN()%c%cret%c%c", 0
	prog: db "_prog:%c%cpush rbp%c%cmov rbp, rsp%c%csub rsp, 8%c%cmov rax, MAC_SYSCALL(5)%c%clea rdi, [rel filename]%c%cmov rsi, 0x601%c%cmov rdx, 0x1a4%c%csyscall%c%cmov rbx, rax%c%cxor rax, rax%c%cmov rdi, rbx%c%clea rsi, [rel beginning]%c%cmov rdx, 0x25%c%cmov rcx, 0xa%c%cmov r8, 0x25%c%cmov r9, 0xa%c%clea r10, [rel filename]%c%clea r11, [rel beginning]%c%clea r12, [rel prog]%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r12%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r11%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r10%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0xa%c%ccall _dprintf%c%cxor rax, rax%c%cmov rdi, rbx%c%clea rsi, [rel prog]%c%cmov rdx, 0xa%c%cmov r8, 0xa%c%cmov r9, 0x9%c%cpush byte 0xa%c%cmov rcx, 67%c%cloop_line:%c%cpush byte 0x9%c%cpush byte 0xa%c%cloop loop_line%c%cmov rcx, 0x9%c%ccall _dprintf%c%cmov rax, MAC_SYSCALL(6)%c%cmov rdi, rbx%c%csyscall%c%cleave%c%cret%c", 0

segment .text
	global _main
	global _prog
	extern _dprintf

MAIN()
	ret

_prog:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	mov rax, MAC_SYSCALL(5)
	lea rdi, [rel filename]
	mov rsi, 0x601
	mov rdx, 0x1a4
	syscall
	mov rbx, rax
	xor rax, rax
	mov rdi, rbx
	lea rsi, [rel beginning]
	mov rdx, 0x25
	mov rcx, 0xa
	mov r8, 0x25
	mov r9, 0xa
	lea r10, [rel filename]
	lea r11, [rel beginning]
	lea r12, [rel prog]
	push byte 0xa
	push byte 0xa
	push byte 0x9
	push byte 0xa
	push byte 0xa
	push byte 0xa
	push byte 0x9
	push byte 0xa
	push byte 0x9
	push byte 0xa
	push byte 0x9
	push byte 0xa
	push byte 0xa
	push byte 0xa
	push byte 0x22
	push qword r12
	push byte 0x22
	push byte 0x9
	push byte 0xa
	push byte 0x22
	push qword r11
	push byte 0x22
	push byte 0x9
	push byte 0xa
	push byte 0x22
	push qword r10
	push byte 0x22
	push byte 0x9
	push byte 0xa
	push byte 0xa
	call _dprintf
	xor rax, rax
	mov rdi, rbx
	lea rsi, [rel prog]
	mov rdx, 0xa
	mov r8, 0xa
	mov r9, 0x9
	push byte 0xa
	mov rcx, 67
	loop_line:
	push byte 0x9
	push byte 0xa
	loop loop_line
	mov rcx, 0x9
	call _dprintf
	mov rax, MAC_SYSCALL(6)
	mov rdi, rbx
	syscall
	leave
	ret
