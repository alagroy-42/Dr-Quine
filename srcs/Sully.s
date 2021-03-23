%define MAC_SYSCALL(x) 0x2000000 | x

segment .data
	filename: db "Sully_x.s", 0
	filefakename: db "Sully_x.s", 0
	exec: db "./Sully_x", 0
	cmd: db "nasm -f macho64 Sully_x.s -o Sully_x.o ; ld -arch x86_64 -macos_version_min 10.13 -lSystem Sully_x.o -o Sully_x", 0
	decl: db "%%define MAC_SYSCALL(x) 0x2000000 | x%c%csegment .data%c%cfilename: db %c%s%c, 0%c%cfilefakename: db %c%s%c, 0%c%cexec: db %c%s%c, 0%c%ccmd: db %c%s%c, 0%c%cdecl: db %c%s%c, 0%c%ctext: db %c%s%c, 0%c%csegment .text%c%cglobal _main%c%cextern _dprintf%c%cextern _system%c%cextern _execvp%c%c", 0
	text: db "_main:%c%cpush rbp%c%cmov rbp, rsp%c%cmov r8, %d%c%cdec r8%c%cpush r8%c%csub rsp, 8%c%cadd r8, 48%c%cmov [rel filename + 6], r8b%c%cmov rax, MAC_SYSCALL(5)%c%clea rdi, [rel filename]%c%cmov rsi, 0x601%c%cmov rdx, 0x1a4%c%csyscall%c%cmov bl, al%c%cxor rax, rax%c%cmovzx rdi, byte bl%c%clea rsi, [rel decl]%c%cmov rdx, 0xa%c%cmov r8, 0xa%c%cmov r9, 0x9%c%clea r10, [rel filefakename]%c%clea r11, [rel exec]%c%clea r12, [rel cmd]%c%clea r13, [rel text]%c%cpush byte 0xa%c%cpush byte 0xa%c%cmov rcx, 4%c%cloop1:%c%cpush byte 0x9%c%cpush byte 0xa%c%cloop loop1%c%cpush byte 0xa%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r13%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword rsi%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r12%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r11%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r10%c%cpush byte 0x22%c%cpush byte 0x9%c%cpush byte 0xa%c%cpush byte 0x22%c%cpush qword r10%c%cpush byte 0x22%c%cmov rcx, 0xa%c%ccall _dprintf%c%cxor rax, rax%c%cmovzx rdi, byte bl%c%clea rsi, [rel text]%c%cmov rdx, 0xa%c%cmov r8, 0xa%c%cmov r9, 0x9%c%cmovzx r10, byte [rbp - 8]%c%cpush byte 0xa%c%cmov rcx, 99%c%cloop2:%c%cpush byte 0x9%c%cpush byte 0xa%c%cloop loop2%c%cpush r10%c%cpush byte 0x9%c%cpush byte 0xa%c%cmov rcx, 0x9%c%ccall _dprintf%c%cmov rax, MAC_SYSCALL(6)%c%cmovzx rdi, byte bl%c%csyscall%c%cmovzx r10, byte [rbp - 8]%c%cadd r10, 48%c%cmov [rel exec + 8], r10b%c%cmov [rel cmd + 22], r10b%c%cmov [rel cmd + 35], r10b%c%cmov [rel cmd + 97], r10b%c%cmov [rel cmd + 110], r10b%c%clea rdi, [rel cmd]%c%ccall _system%c%ccmp byte [rbp - 8], 0%c%cje end_main%c%clea rdi, [rel exec]%c%cmov rsi, 0%c%ccall _execvp%c%cend_main:%c%cmov rax, 0%c%cleave%c%cret%c", 0

segment .text
	global _main
	extern _dprintf
	extern _system
	extern _execvp

_main:
	push rbp
	mov rbp, rsp
	mov r8, 5
	dec r8
	push r8
	sub rsp, 8
	add r8, 48
	mov [rel filename + 6], r8b
	mov rax, MAC_SYSCALL(5)
	lea rdi, [rel filename]
	mov rsi, 0x601
	mov rdx, 0x1a4
	syscall
	mov bl, al
	xor rax, rax
	movzx rdi, byte bl
	lea rsi, [rel decl]
	mov rdx, 0xa
	mov r8, 0xa
	mov r9, 0x9
	lea r10, [rel filefakename]
	lea r11, [rel exec]
	lea r12, [rel cmd]
	lea r13, [rel text]
	push byte 0xa
	push byte 0xa
	mov rcx, 4
	loop1:
	push byte 0x9
	push byte 0xa
	loop loop1
	push byte 0xa
	push byte 0xa
	push byte 0x22
	push qword r13
	push byte 0x22
	push byte 0x9
	push byte 0xa
	push byte 0x22
	push qword rsi
	push byte 0x22
	push byte 0x9
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
	push byte 0x22
	push qword r10
	push byte 0x22
	mov rcx, 0xa
	call _dprintf
	xor rax, rax
	movzx rdi, byte bl
	lea rsi, [rel text]
	mov rdx, 0xa
	mov r8, 0xa
	mov r9, 0x9
	movzx r10, byte [rbp - 8]
	push byte 0xa
	mov rcx, 99
	loop2:
	push byte 0x9
	push byte 0xa
	loop loop2
	push r10
	push byte 0x9
	push byte 0xa
	mov rcx, 0x9
	call _dprintf
	mov rax, MAC_SYSCALL(6)
	movzx rdi, byte bl
	syscall
	movzx r10, byte [rbp - 8]
	add r10, 48
	mov [rel exec + 8], r10b
	mov [rel cmd + 22], r10b
	mov [rel cmd + 35], r10b
	mov [rel cmd + 97], r10b
	mov [rel cmd + 110], r10b
	lea rdi, [rel cmd]
	call _system
	cmp byte [rbp - 8], 0
	je end_main
	lea rdi, [rel exec]
	mov rsi, 0
	call _execvp
	end_main:
	mov rax, 0
	leave
	ret
