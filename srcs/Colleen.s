segment .data ; data
	data: db "segment .data ; data%c%cdata: db %c%s%c, 0%c%ctext: db %c%s%c, 0%c%cmain: db %c%s%c, 0%c%cprint_code: db %c%s%c, 0%c%c", 0
	text: db "segment .text%c%cglobal _start%c%cglobal _main%c%cglobal _print_code%c%cextern _printf%c%c_start:%c%ccall _main%c%cret%c%c", 0
	main: db "_main:%c%cpush rbp%c%cmov rbp, rsp%c%csub rsp, 8%c%cxor rax, rax%c%clea rdi, [rel data]%c%cmov rsi, 0xa%c%cmov rdx, 0x9%c%cmov rcx, 0x22%c%clea r8, [rel data]%c%cmov r9, 0x22%c%clea r10, [rel text]%c%clea r11, [rel main]%c%clea r12, [rel print_code]%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r12%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r11%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r10%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%ccall _printf%c%cxor rax, rax%c%clea rdi, [rel text]%c%cmov rsi, 0xa%c%cmov rdx, 0x9%c%cmov rcx, 0xa%c%cmov r8, 0x9%c%cmov r9, 0xa%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x9%c%ccall _printf%c%ccall _print_code%c%cleave%c%cret%c%c", 0
	print_code: db "_print_code:%c%cpush rbp%c%cmov rbp, rsp%c%csub rsp, 8%c%cxor rax, rax%c%clea rdi, [rel main]%c%cmov rsi, 0xa%c%cmov rdx, 0x9%c%cmov r8, 0x9%c%cmov r9, 0xa%c%cpush byte 0xa%c%cpush byte 0xa%c%cmov rcx, 50%c%cline:%c%cpush byte 0x9%c%cpush byte 0xa%c%cloop line%c%cpush byte 0x9%c%cmov rcx, 0xa%c%ccall _printf%c%cxor rax, rax%c%clea rdi, [rel print_code]%c%cmov rsi, 0xa%c%cmov rdx, 0x9%c%cmov r8, 0x9%c%cmov r9, 0xa%c%cpush byte 0xa%c%cmov rcx, 33%c%cline2:%c%cpush byte 0x9%c%cpush byte 0xa%c%cloop line2%c%cpush byte 0x9%c%cmov rcx, 0xa%c%ccall _printf%c%cleave%c%cret%c", 0

segment .text
	global _start
	global _main
	global _print_code
	extern _printf

_start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor rax, rax
	lea rdi, [rel data]
	mov rsi, 0xa
	mov rdx, 0x9
	mov rcx, 0x22
	lea r8, [rel data]
	mov r9, 0x22
	lea r10, [rel text]
	lea r11, [rel main]
	lea r12, [rel print_code]
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
	call _printf
	xor rax, rax
	lea rdi, [rel text]
	mov rsi, 0xa
	mov rdx, 0x9
	mov rcx, 0xa
	mov r8, 0x9
	mov r9, 0xa
	push byte 0xa
	push byte 0xa
	push byte 0x9
	push byte 0xa
	push byte 0x9
	push byte 0xa
	push byte 0xa
	push byte 0xa
	push byte 0x9
	push byte 0xa
	push byte 0x9
	call _printf
	call _print_code
	leave
	ret

_print_code:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	xor rax, rax
	lea rdi, [rel main]
	mov rsi, 0xa
	mov rdx, 0x9
	mov r8, 0x9
	mov r9, 0xa
	push byte 0xa
	push byte 0xa
	mov rcx, 50
	line:
	push byte 0x9
	push byte 0xa
	loop line
	push byte 0x9
	mov rcx, 0xa
	call _printf
	xor rax, rax
	lea rdi, [rel print_code]
	mov rsi, 0xa
	mov rdx, 0x9
	mov r8, 0x9
	mov r9, 0xa
	push byte 0xa
	mov rcx, 33
	line2:
	push byte 0x9
	push byte 0xa
	loop line2
	push byte 0x9
	mov rcx, 0xa
	call _printf
	leave
	ret
