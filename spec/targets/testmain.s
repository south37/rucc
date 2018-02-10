	.text
__va_arg_gp:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	sub $8, %rsp
	.file 1 "/home/vagrant/rucc/thirdparty/8cc/include/stdarg.h"
	.loc 1 23 0
	# }
	.loc 1 21 0
	#     ap->gp_offset += 8;
	mov -8(%rbp), %rax
	mov 16(%rax), %rax
	push %rcx
	push %rax
	mov -8(%rbp), %rax
	movslq 0(%rax), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -16(%rbp)
	.loc 1 22 0
	#     return r;
	mov -8(%rbp), %rax
	movslq 0(%rax), %rax
	push %rax
	mov $8, %rax
	cltq
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	mov %eax, %eax
	push %rax
	mov -8(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 1 23 0
	# }
	.loc 1 21 0
	#     ap->gp_offset += 8;
	mov -16(%rbp), %rax
	leave
	ret
	leave
	ret
	.text
__va_arg_fp:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	sub $8, %rsp
	.loc 1 29 0
	# }
	.loc 1 27 0
	#     ap->fp_offset += 16;
	.loc 1 23 0
	# }
	mov -8(%rbp), %rax
	mov 16(%rax), %rax
	push %rcx
	push %rax
	.loc 1 27 0
	#     ap->fp_offset += 16;
	.loc 1 23 0
	# }
	mov -8(%rbp), %rax
	movslq 4(%rax), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -16(%rbp)
	.loc 1 28 0
	#     return r;
	.loc 1 23 0
	# }
	mov -8(%rbp), %rax
	movslq 4(%rax), %rax
	push %rax
	.loc 1 28 0
	#     return r;
	mov $16, %rax
	cltq
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	mov %eax, %eax
	push %rax
	.loc 1 23 0
	# }
	mov -8(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, 4(%rax)
	pop %rax
	.loc 1 29 0
	# }
	.loc 1 27 0
	#     ap->fp_offset += 16;
	mov -16(%rbp), %rax
	leave
	ret
	leave
	ret
	.text
__va_arg_mem:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 1 33 0
	# }
	mov $1, %rax
	push %rax
	mov $0, %rax
	mov %rax, %rcx
	pop %rax
	cqto
	idiv %rcx
	leave
	ret
	.text
__bswap_16:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.file 2 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.loc 2 47 0
	# }
	.loc 1 33 0
	# }
	movswq -8(%rbp), %rax
	movzwq %ax, %rax
	push %rax
	.loc 2 47 0
	# }
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %eax
	movzwq %ax, %rax
	push %rax
	mov $255, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	.loc 1 33 0
	# }
	movswq -8(%rbp), %rax
	movzwq %ax, %rax
	push %rax
	.loc 2 47 0
	# }
	mov $255, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
	pop %rcx
	or %rcx, %rax
	cltq
	movzwq %ax, %rax
	leave
	ret
	leave
	ret
	.text
__bswap_32:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.file 3 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.loc 3 90 0
	# }
	.loc 2 47 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 90 0
	# }
	mov $4278190080, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $24, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %eax
	push %rax
	.loc 2 47 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 90 0
	# }
	mov $16711680, %rax
	cltq
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %eax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 2 47 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 90 0
	# }
	mov $65280, %rax
	cltq
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 2 47 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 90 0
	# }
	mov $255, %rax
	cltq
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $24, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
	pop %rcx
	or %rcx, %rax
	mov %eax, %eax
	leave
	ret
	leave
	ret
	.text
__bswap_64:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 3 151 0
	# }
	.loc 3 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 3 151 0
	# }
	mov $18374686479671623680, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $56, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %rax
	push %rax
	.loc 3 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 3 151 0
	# }
	mov $71776119061217280, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $40, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 3 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 3 151 0
	# }
	mov $280375465082880, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $24, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 3 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 3 151 0
	# }
	mov $1095216660480, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 3 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 3 151 0
	# }
	mov $4278190080, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 3 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 3 151 0
	# }
	mov $16711680, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $24, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 3 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 3 151 0
	# }
	mov $65280, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $40, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 3 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 3 151 0
	# }
	mov $255, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $56, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %rax
	pop %rcx
	or %rcx, %rax
	leave
	ret
	leave
	ret
	.data 0
.global externvar1
externvar1:
	.long 98
	.data 0
.global externvar2
externvar2:
	.long 99
	.text
.global booltest1
booltest1:
	nop
	push %rbp
	mov %rsp, %rbp
	movzb %dil, %edi
	push %rdi
	.file 4 "/home/vagrant/rucc/spec/targets/testmain.c"
	.loc 4 17 0
	# }
	.loc 3 151 0
	# }
	movsbq -8(%rbp), %rax
	movsbq %al, %rax
	leave
	ret
	leave
	ret
	.text
.global oldstyle1
oldstyle1:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	.loc 4 21 0
	# }
	.loc 4 17 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global print
print:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 4 26 0
	# }
	.loc 4 25 0
	#     fflush(stdout);
	push %rdi
	push %rsi
	sub $8, %rsp
.data
	.L0:
	.string "Testing %s ... "
.text
	lea .L0(%rip), %rax
	push %rax
	.loc 4 21 0
	# }
	mov -8(%rbp), %rax
	push %rax
	pop %rsi
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 4 26 0
	# }
	push %rdi
	.loc 1 33 0
	# }
	mov stdout+0(%rip), %rax
	push %rax
	pop %rdi
	call fflush@PLT
	pop %rdi
	leave
	ret
	.text
.global printfail
printfail:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 30 0
	# }
	push %rdi
	sub $8, %rsp
	push %rdi
	sub $8, %rsp
	push %rdi
	sub $8, %rsp
	.loc 1 33 0
	# }
	mov stdout+0(%rip), %rax
	push %rax
	pop %rdi
	call fileno@PLT
	add $8, %rsp
	pop %rdi
	push %rax
	pop %rdi
	call isatty@PLT
	add $8, %rsp
	pop %rdi
	test %rax, %rax
	je .L1
	.loc 4 30 0
	# }
.data
	.L2:
	.string "\x1b[1;31mFailed\x1b[0m\n"
.text
	lea .L2(%rip), %rax
	jmp .L3
	.L1:
.data
	.L4:
	.string "Failed\n"
.text
	lea .L4(%rip), %rax
	.L3:
	push %rax
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %rdi
	leave
	ret
	.text
.global ffail
ffail:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	push %rdx
	.loc 4 36 0
	# }
	.loc 4 34 0
	#     printf("%s:%d: %s\n", file, line, msg);
	sub $8, %rsp
	call printfail@PLT
	add $8, %rsp
	.loc 4 35 0
	#     exit(1);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L5:
	.string "%s:%d: %s\n"
.text
	lea .L5(%rip), %rax
	push %rax
	.loc 4 30 0
	# }
	mov -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	push %rax
	mov -24(%rbp), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 4 36 0
	# }
	push %rdi
	mov $1, %rax
	push %rax
	pop %rdi
	call exit@PLT
	pop %rdi
	leave
	ret
	.text
.global fexpect
fexpect:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 4 44 0
	# }
	.loc 4 40 0
	#         return;
	.loc 4 36 0
	# }
	movslq -24(%rbp), %rax
	push %rax
	movslq -32(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L6
	.loc 4 40 0
	#         return;
	leave
	ret
	.L6:
	.loc 4 42 0
	#     printf("%s:%d: %d expected, but got %d\n", file, line, a, b);
	call printfail@PLT
	.loc 4 43 0
	#     exit(1);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	sub $8, %rsp
.data
	.L7:
	.string "%s:%d: %d expected, but got %d\n"
.text
	lea .L7(%rip), %rax
	push %rax
	.loc 4 36 0
	# }
	mov -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	push %rax
	movslq -24(%rbp), %rax
	push %rax
	movslq -32(%rbp), %rax
	push %rax
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 4 44 0
	# }
	push %rdi
	sub $8, %rsp
	mov $1, %rax
	push %rax
	pop %rdi
	call exit@PLT
	add $8, %rsp
	pop %rdi
	leave
	ret
	.text
.global fexpect_string
fexpect_string:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 4 52 0
	# }
	.loc 4 48 0
	#         return;
	push %rdi
	push %rsi
	.loc 4 44 0
	# }
	mov -24(%rbp), %rax
	push %rax
	mov -32(%rbp), %rax
	push %rax
	pop %rsi
	pop %rdi
	call strcmp@PLT
	pop %rsi
	pop %rdi
	cmp $0, %rax
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L8
	.loc 4 48 0
	#         return;
	leave
	ret
	.L8:
	.loc 4 50 0
	#     printf("%s:%d: \"%s\" expected, but got \"%s\"\n", file, line, a, b);
	call printfail@PLT
	.loc 4 51 0
	#     exit(1);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	sub $8, %rsp
.data
	.L9:
	.string "%s:%d: \"%s\" expected, but got \"%s\"\n"
.text
	lea .L9(%rip), %rax
	push %rax
	.loc 4 44 0
	# }
	mov -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	push %rax
	mov -24(%rbp), %rax
	push %rax
	mov -32(%rbp), %rax
	push %rax
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 4 52 0
	# }
	push %rdi
	sub $8, %rsp
	mov $1, %rax
	push %rax
	pop %rdi
	call exit@PLT
	add $8, %rsp
	pop %rdi
	leave
	ret
	.text
.global fexpectf
fexpectf:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	.loc 4 60 0
	# }
	.loc 4 56 0
	#         return;
	.loc 4 52 0
	# }
	movss -24(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movss -32(%rbp), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomiss %xmm0, %xmm1
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L10
	.loc 4 56 0
	#         return;
	leave
	ret
	.L10:
	.loc 4 58 0
	#     printf("%s:%d: %f expected, but got %f\n", file, line, a, b);
	call printfail@PLT
	.loc 4 59 0
	#     exit(1);
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L11:
	.string "%s:%d: %f expected, but got %f\n"
.text
	lea .L11(%rip), %rax
	push %rax
	.loc 4 52 0
	# }
	mov -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	push %rax
	.loc 4 59 0
	#     exit(1);
	.loc 4 52 0
	# }
	movss -24(%rbp), %xmm0
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 4 59 0
	#     exit(1);
	.loc 4 52 0
	# }
	movss -32(%rbp), %xmm0
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	mov $2, %eax
	call printf@PLT
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 4 60 0
	# }
	push %rdi
	sub $8, %rsp
	mov $1, %rax
	push %rax
	pop %rdi
	call exit@PLT
	add $8, %rsp
	pop %rdi
	leave
	ret
	.text
.global fexpectd
fexpectd:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	.loc 4 68 0
	# }
	.loc 4 64 0
	#         return;
	.loc 4 60 0
	# }
	movsd -24(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd -32(%rbp), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L12
	.loc 4 64 0
	#         return;
	leave
	ret
	.L12:
	.loc 4 66 0
	#     printf("%s:%d: %lf expected, but got %lf\n", file, line, a, b);
	call printfail@PLT
	.loc 4 67 0
	#     exit(1);
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L13:
	.string "%s:%d: %lf expected, but got %lf\n"
.text
	lea .L13(%rip), %rax
	push %rax
	.loc 4 60 0
	# }
	mov -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	push %rax
	movsd -24(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd -32(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	mov $2, %eax
	call printf@PLT
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 4 68 0
	# }
	push %rdi
	sub $8, %rsp
	mov $1, %rax
	push %rax
	pop %rdi
	call exit@PLT
	add $8, %rsp
	pop %rdi
	leave
	ret
	.text
.global fexpectl
fexpectl:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 4 76 0
	# }
	.loc 4 72 0
	#         return;
	.loc 4 68 0
	# }
	mov -24(%rbp), %rax
	push %rax
	mov -32(%rbp), %rax
	pop %rcx
	cmp %rax, %rcx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L14
	.loc 4 72 0
	#         return;
	leave
	ret
	.L14:
	.loc 4 74 0
	#     printf("%s:%d: %ld expected, but got %ld\n", file, line, a, b);
	call printfail@PLT
	.loc 4 75 0
	#     exit(1);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	sub $8, %rsp
.data
	.L15:
	.string "%s:%d: %ld expected, but got %ld\n"
.text
	lea .L15(%rip), %rax
	push %rax
	.loc 4 68 0
	# }
	mov -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	push %rax
	.loc 4 75 0
	#     exit(1);
	.loc 4 68 0
	# }
	mov -24(%rbp), %rax
	push %rax
	.loc 4 75 0
	#     exit(1);
	.loc 4 68 0
	# }
	mov -32(%rbp), %rax
	push %rax
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 4 76 0
	# }
	push %rdi
	sub $8, %rsp
	mov $1, %rax
	push %rax
	pop %rdi
	call exit@PLT
	add $8, %rsp
	pop %rdi
	leave
	ret
	.text
.global main
main:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 82 0
	# }
	.loc 4 80 0
	#     printf(isatty(fileno(stdout)) ? "\e[32mOK\e[0m\n" : "OK\n");
	call testmain@PLT
	.loc 4 81 0
	#     return 0;
	push %rdi
	sub $8, %rsp
	push %rdi
	sub $8, %rsp
	push %rdi
	sub $8, %rsp
	.loc 1 33 0
	# }
	mov stdout+0(%rip), %rax
	push %rax
	pop %rdi
	call fileno@PLT
	add $8, %rsp
	pop %rdi
	push %rax
	pop %rdi
	call isatty@PLT
	add $8, %rsp
	pop %rdi
	test %rax, %rax
	je .L16
	.loc 4 81 0
	#     return 0;
.data
	.L17:
	.string "\x1b[32mOK\x1b[0m\n"
.text
	lea .L17(%rip), %rax
	jmp .L18
	.L16:
.data
	.L19:
	.string "OK\n"
.text
	lea .L19(%rip), %rax
	.L18:
	push %rax
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %rdi
	.loc 4 82 0
	# }
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
