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
expects:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	.file 2 "/home/vagrant/rucc/spec/targets/int.c"
	.loc 2 9 0
	#     }
	.loc 2 6 0
	#         printf("Failed\n");
	.loc 1 33 0
	# }
	movswq -8(%rbp), %rax
	movswq %ax, %rax
	push %rax
	.loc 2 6 0
	#         printf("Failed\n");
	.loc 1 33 0
	# }
	movswq -16(%rbp), %rax
	movswq %ax, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	cmp $0, %rax
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L0
	.loc 2 9 0
	#     }
	.loc 2 7 0
	#         printf("  %d expected, but got %d\n", a, b);
	push %rdi
	sub $8, %rsp
.data
	.L1:
	.string "Failed\n"
.text
	lea .L1(%rip), %rax
	push %rax
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 8 0
	#         exit(1);
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
.data
	.L2:
	.string "  %d expected, but got %d\n"
.text
	lea .L2(%rip), %rax
	push %rax
	.loc 1 33 0
	# }
	movswq -8(%rbp), %rax
	movswq %ax, %rax
	push %rax
	.loc 2 8 0
	#         exit(1);
	.loc 1 33 0
	# }
	movswq -16(%rbp), %rax
	movswq %ax, %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	mov $0, %eax
	call printf@PLT
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 9 0
	#     }
	push %rdi
	sub $8, %rsp
	mov $1, %rax
	push %rax
	pop %rdi
	call exit
	add $8, %rsp
	pop %rdi
	.L0:
	leave
	ret
	.text
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 28 0
	# }
	.loc 2 14 0
	# 
	push %rdi
	sub $8, %rsp
.data
	.L3:
	.string "long"
.text
	lea .L3(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 2 16 0
	#     short int b = 15;
	mov $10, %rax
	cltq
	mov %ax, -8(%rbp)
	.loc 2 17 0
	#     expects(25, a + b);
	mov $15, %rax
	cltq
	mov %ax, -16(%rbp)
	.loc 2 18 0
	#     expects(20, a + 10);
	push %rdi
	push %rsi
	mov $25, %rax
	cltq
	push %rax
	.loc 2 16 0
	#     short int b = 15;
	movswq -8(%rbp), %rax
	movswq %ax, %rax
	push %rax
	.loc 2 18 0
	#     expects(20, a + 10);
	.loc 2 17 0
	#     expects(25, a + b);
	movswq -16(%rbp), %rax
	movswq %ax, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	push %rax
	pop %rsi
	pop %rdi
	call expects
	pop %rsi
	pop %rdi
	.loc 2 19 0
	# 
	push %rdi
	push %rsi
	mov $20, %rax
	cltq
	push %rax
	.loc 2 16 0
	#     short int b = 15;
	movswq -8(%rbp), %rax
	movswq %ax, %rax
	push %rax
	.loc 2 19 0
	# 
	mov $10, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	push %rax
	pop %rsi
	pop %rdi
	call expects
	pop %rsi
	pop %rdi
	.loc 2 21 0
	#     long int y = 69;
	mov $67, %rax
	cltq
	mov %rax, -24(%rbp)
	.loc 2 22 0
	#     expectl(67, x);
	mov $69, %rax
	cltq
	mov %rax, -32(%rbp)
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 24 0
	# 
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
	mov $67, %rax
	cltq
	push %rax
	.loc 2 21 0
	#     long int y = 69;
	mov -24(%rbp), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpectl
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 24 0
	# 
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L5:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L5(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $136, %rax
	cltq
	push %rax
	.loc 2 21 0
	#     long int y = 69;
	mov -24(%rbp), %rax
	push %rax
	.loc 2 22 0
	#     expectl(67, x);
	mov -32(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpectl
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 24 0
	# 
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L6:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L6(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	mov $10, %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpectl
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L7:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L7(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4294967295, %rax
	push %rax
	mov $4294967295, %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpectl
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L8:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L8(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1152921504606846976, %rax
	push %rax
	mov $1152921504606846976, %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpectl
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L9:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L9(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1152921504606846977, %rax
	push %rax
	mov $1152921504606846976, %rax
	push %rax
	mov $1, %rax
	cltq
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpectl
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
