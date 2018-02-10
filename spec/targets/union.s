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
t1:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.file 2 "/home/vagrant/rucc/spec/targets/union.c"
	.loc 2 8 0
	# }
	.loc 2 6 0
	#     x.a = 90;
	.loc 2 7 0
	#     expect(90, x.b);
	mov $90, %rax
	cltq
	mov %eax, -8(%rbp)
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L0:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L0(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $90, %rax
	push %rax
	movslq -8(%rbp), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
t2:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 15 0
	# }
	.loc 2 12 0
	#     x.b = 0;
	.loc 2 13 0
	#     x.a[1] = 1;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 14 0
	#     expect(256, x.b);
	mov $1, %rax
	cltq
	movsbq %al, %rax
	push %rax
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %cl, (%rax)
	pop %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L1:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L1(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $256, %rax
	push %rax
	movslq -8(%rbp), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
t3:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 22 0
	# }
	.loc 2 19 0
	#     x.a[0] = x.a[1] = x.a[2] = x.a[3] = 0;
	.loc 2 20 0
	#     x.a[1]=1;
	mov $0, %rax
	cltq
	movsbq %al, %rax
	push %rax
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $3, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %cl, (%rax)
	pop %rax
	movsbq %al, %rax
	cltq
	movsbq %al, %rax
	push %rax
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %cl, (%rax)
	pop %rax
	movsbq %al, %rax
	cltq
	movsbq %al, %rax
	push %rax
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %cl, (%rax)
	pop %rax
	movsbq %al, %rax
	cltq
	movsbq %al, %rax
	push %rax
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $0, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %cl, (%rax)
	pop %rax
	.loc 2 21 0
	#     expect(256, x.b);
	mov $1, %rax
	cltq
	movsbq %al, %rax
	push %rax
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %cl, (%rax)
	pop %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L2:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L2(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $256, %rax
	push %rax
	movslq -8(%rbp), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
test_sizeof:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 28 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L3:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L3(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	mov $4, %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
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
	mov $8, %rax
	push %rax
	mov $8, %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
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
	mov $8, %rax
	push %rax
	mov $8, %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect
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
	.loc 2 36 0
	# }
	.loc 2 32 0
	#     t1();
	push %rdi
	sub $8, %rsp
.data
	.L6:
	.string "union"
.text
	lea .L6(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 2 33 0
	#     t2();
	call t1
	.loc 2 34 0
	#     t3();
	call t2
	.loc 2 35 0
	#     test_sizeof();
	call t3
	.loc 2 36 0
	# }
	call test_sizeof
	leave
	ret
