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
	.file 2 "/home/vagrant/rucc/spec/targets/decl.c"
	.loc 2 7 0
	# }
	.loc 2 6 0
	#     expect(3, a + 2);
	movl $1, -8(%rbp)
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
	mov $3, %rax
	push %rax
	.loc 2 6 0
	#     expect(3, a + 2);
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
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
t2:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 14 0
	# }
	.loc 2 11 0
	#     int b = 48 + 2;
	movl $1, -8(%rbp)
	.loc 2 12 0
	#     int c = a + b;
	mov $48, %rax
	push %rax
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	mov %eax, -16(%rbp)
	.loc 2 13 0
	#     expect(102, c * 2);
	.loc 2 11 0
	#     int b = 48 + 2;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 12 0
	#     int c = a + b;
	movslq -16(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	mov %eax, -24(%rbp)
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
	mov $102, %rax
	push %rax
	.loc 2 13 0
	#     expect(102, c * 2);
	movslq -24(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	imul %rcx, %rax
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
t3:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 20 0
	# }
	.loc 2 18 0
	#     int *b = a;
	movl $55, -8(%rbp)
	.loc 2 19 0
	#     expect(55, *b);
	.loc 2 18 0
	#     int *b = a;
	lea -8(%rbp), %rax
	mov %rax, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L2:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L2(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $55, %rax
	push %rax
	.loc 2 19 0
	#     expect(55, *b);
	mov -16(%rbp), %rax
	movslq 0(%rax), %rax
	cltq
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
	leave
	ret
	.text
t4:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 26 0
	# }
	.loc 2 24 0
	#     int *b = a + 1;
	movl $55, -8(%rbp)
	movl $67, -4(%rbp)
	.loc 2 25 0
	#     expect(67, *b);
	.loc 2 24 0
	#     int *b = a + 1;
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 25 0
	#     expect(67, *b);
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -16(%rbp)
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
	mov $67, %rax
	push %rax
	.loc 2 25 0
	#     expect(67, *b);
	mov -16(%rbp), %rax
	movslq 0(%rax), %rax
	cltq
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
	leave
	ret
	.text
t5:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 32 0
	# }
	.loc 2 30 0
	#     int *b = a + 1;
	movl $20, -16(%rbp)
	movl $30, -12(%rbp)
	movl $40, -8(%rbp)
	.loc 2 31 0
	#     expect(30, *b);
	.loc 2 30 0
	#     int *b = a + 1;
	lea -16(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 31 0
	#     expect(30, *b);
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -24(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L4:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L4(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $30, %rax
	push %rax
	.loc 2 31 0
	#     expect(30, *b);
	mov -24(%rbp), %rax
	movslq 0(%rax), %rax
	cltq
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
t6:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 37 0
	# }
	.loc 2 36 0
	#     expect(20, *a);
	movl $20, -16(%rbp)
	movl $30, -12(%rbp)
	movl $40, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $20, %rax
	push %rax
	.loc 2 36 0
	#     expect(20, *a);
	lea -16(%rbp), %rax
	movslq 0(%rax), %rax
	cltq
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
	leave
	ret
	.data
	.lcomm t7, 0
	.data
	.lcomm t8, 8
	.data
	.lcomm t9, 8
	.text
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 51 0
	# }
	.loc 2 45 0
	#     t1();
	push %rdi
	sub $8, %rsp
.data
	.L6:
	.string "declaration"
.text
	lea .L6(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 46 0
	#     t2();
	call t1@PLT
	.loc 2 47 0
	#     t3();
	call t2@PLT
	.loc 2 48 0
	#     t4();
	call t3@PLT
	.loc 2 49 0
	#     t5();
	call t4@PLT
	.loc 2 50 0
	#     t6();
	call t5@PLT
	.loc 2 51 0
	# }
	call t6@PLT
	leave
	ret
