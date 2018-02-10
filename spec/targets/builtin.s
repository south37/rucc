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
test_return_address_sub2:
	nop
	push %rbp
	mov %rsp, %rbp
	.file 2 "/home/vagrant/rucc/spec/targets/builtin.c"
	.loc 2 11 0
	# }
	push %r11
	mov $1, %rax
	mov %rbp, %r11
	.L2:
	test %rax, %rax
	jz .L3
	mov (%r11), %r11
	sub $1, %rax
	jmp .L2
	.L3:
	mov 8(%r11), %rax
	pop %r11
	leave
	ret
	leave
	ret
	.text
test_return_address_sub1:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 16 0
	# }
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L4:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L4(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	push %r11
	mov $0, %rax
	mov %rbp, %r11
	.L5:
	test %rax, %rax
	jz .L6
	mov (%r11), %r11
	sub $1, %rax
	jmp .L5
	.L6:
	mov 8(%r11), %rax
	pop %r11
	push %rax
	sub $8, %rsp
	call test_return_address_sub2@PLT
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 16 0
	# }
	push %r11
	mov $0, %rax
	mov %rbp, %r11
	.L7:
	test %rax, %rax
	jz .L8
	mov (%r11), %r11
	sub $1, %rax
	jmp .L7
	.L8:
	mov 8(%r11), %rax
	pop %r11
	leave
	ret
	leave
	ret
	.text
test_return_address:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 24 0
	# }
	.loc 2 20 0
	#  L1:
	.loc 2 21 0
	#     ptr = test_return_address_sub1();
	.L0:
	sub $8, %rsp
	call test_return_address_sub1@PLT
	add $8, %rsp
	mov %rax, -8(%rbp)
	.loc 2 23 0
	#     expect(1, &&L1 < ptr && ptr <= &&L2);
	.L1:
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L9:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L9(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $.L0, %rax
	push %rax
	.loc 2 20 0
	#  L1:
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	mov $0, %rax
	je .L10
	.loc 2 23 0
	#     expect(1, &&L1 < ptr && ptr <= &&L2);
	.loc 2 20 0
	#  L1:
	mov -8(%rbp), %rax
	push %rax
	.loc 2 23 0
	#     expect(1, &&L1 < ptr && ptr <= &&L2);
	mov $.L1, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
	test %rax, %rax
	mov $0, %rax
	je .L10
	mov $1, %rax
	.L10:
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 33 0
	# }
	.loc 2 32 0
	#     test_return_address();
	push %rdi
	sub $8, %rsp
.data
	.L11:
	.string "builtin"
.text
	lea .L11(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 33 0
	# }
	call test_return_address@PLT
	leave
	ret
