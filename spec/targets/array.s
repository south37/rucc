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
	mov %eax, %rax
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
	mov %eax, %rax
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
	sub $32, %rsp
	.file 2 "/home/vagrant/rucc/spec/targets/array.c"
	.loc 2 9 0
	# }
	.loc 2 6 0
	#     int *p = a;
	.loc 2 7 0
	#     *p = 1;
	.loc 2 6 0
	#     int *p = a;
	lea -24(%rbp), %rax
	mov %rax, -32(%rbp)
	.loc 2 8 0
	#     expect(1, *p);
	mov $1, %rax
	cltq
	push %rax
	.loc 2 7 0
	#     *p = 1;
	mov -32(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L0:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L0(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 7 0
	#     *p = 1;
	mov -32(%rbp), %rax
	movslq 0(%rax), %rax
	cltq
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
t2:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $40, %rsp
	.loc 2 18 0
	# }
	.loc 2 13 0
	#     int *p = a + 1;
	.loc 2 14 0
	#     *p = 1;
	.loc 2 13 0
	#     int *p = a + 1;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 14 0
	#     *p = 1;
	mov $1, %rax
	imul $12, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -32(%rbp)
	.loc 2 15 0
	#     int *q = a;
	mov $1, %rax
	cltq
	push %rax
	.loc 2 14 0
	#     *p = 1;
	mov -32(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 16 0
	#     *p = 32;
	.loc 2 13 0
	#     int *p = a + 1;
	lea -24(%rbp), %rax
	mov %rax, -40(%rbp)
	.loc 2 17 0
	#     expect(32, *(q + 3));
	mov $32, %rax
	cltq
	push %rax
	.loc 2 14 0
	#     *p = 1;
	mov -32(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
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
	mov $32, %rax
	push %rax
	.loc 2 16 0
	#     *p = 32;
	mov -40(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $3, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
	sub $88, %rsp
	.loc 2 25 0
	# }
	.loc 2 22 0
	#     int *p = a;
	.loc 2 23 0
	#     *(*(a + 1) + 2) = 62;
	.loc 2 22 0
	#     int *p = a;
	lea -80(%rbp), %rax
	mov %rax, -88(%rbp)
	.loc 2 24 0
	#     expect(62, *(p + 7));
	mov $62, %rax
	cltq
	push %rax
	.loc 2 22 0
	#     int *p = a;
	lea -80(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 24 0
	#     expect(62, *(p + 7));
	mov $1, %rax
	imul $20, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $2, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %ecx, (%rax)
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
	mov $62, %rax
	push %rax
	.loc 2 23 0
	#     *(*(a + 1) + 2) = 62;
	mov -88(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $7, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
t4:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 32 0
	# }
	.loc 2 29 0
	#     expect(1, a[0]);
	movl $1, -16(%rbp)
	movl $2, -12(%rbp)
	movl $3, -8(%rbp)
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
	mov $1, %rax
	push %rax
	.loc 2 29 0
	#     expect(1, a[0]);
	lea -16(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
	mov $2, %rax
	push %rax
	.loc 2 29 0
	#     expect(1, a[0]);
	lea -16(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
	mov $3, %rax
	push %rax
	.loc 2 29 0
	#     expect(1, a[0]);
	lea -16(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $2, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
t5:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 41 0
	# }
	.loc 2 36 0
	#     a[0][1] = 1;
	.loc 2 37 0
	#     a[1][1] = 2;
	mov $1, %rax
	cltq
	push %rax
	.loc 2 36 0
	#     a[0][1] = 1;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 37 0
	#     a[1][1] = 2;
	mov $0, %rax
	imul $12, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 38 0
	#     int *p = a;
	mov $2, %rax
	cltq
	push %rax
	.loc 2 36 0
	#     a[0][1] = 1;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 38 0
	#     int *p = a;
	mov $1, %rax
	imul $12, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 39 0
	#     expect(1, p[1]);
	.loc 2 36 0
	#     a[0][1] = 1;
	lea -24(%rbp), %rax
	mov %rax, -32(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $1, %rax
	push %rax
	.loc 2 39 0
	#     expect(1, p[1]);
	mov -32(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
	.L7:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L7(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	.loc 2 39 0
	#     expect(1, p[1]);
	mov -32(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $4, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
t6a:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	.loc 2 45 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	.loc 2 41 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	.loc 2 41 0
	# }
	mov -16(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $12, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
t6:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 52 0
	# }
	.loc 2 49 0
	#     int *p = a;
	.loc 2 50 0
	#     *(p + 4) = 65;
	.loc 2 49 0
	#     int *p = a;
	lea -24(%rbp), %rax
	mov %rax, -32(%rbp)
	.loc 2 51 0
	#     t6a(65, a);
	mov $65, %rax
	cltq
	push %rax
	.loc 2 50 0
	#     *(p + 4) = 65;
	mov -32(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 51 0
	#     t6a(65, a);
	mov $4, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 52 0
	# }
	push %rdi
	push %rsi
	mov $65, %rax
	push %rax
	.loc 2 49 0
	#     int *p = a;
	lea -24(%rbp), %rax
	push %rax
	pop %rsi
	pop %rdi
	call t6a
	pop %rsi
	pop %rdi
	leave
	ret
	.text
t7:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $40, %rsp
	.loc 2 58 0
	# }
	.loc 2 56 0
	#     a[8] = 68;
	.loc 2 57 0
	#     expect(68, a[8]);
	mov $68, %rax
	cltq
	push %rax
	.loc 2 56 0
	#     a[8] = 68;
	lea -40(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 57 0
	#     expect(68, a[8]);
	mov $8, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $68, %rax
	push %rax
	.loc 2 56 0
	#     a[8] = 68;
	lea -40(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $8, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
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
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 69 0
	# }
	.loc 2 62 0
	#     t1();
	push %rdi
	sub $8, %rsp
.data
	.L10:
	.string "array"
.text
	lea .L10(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 2 63 0
	#     t2();
	call t1
	.loc 2 64 0
	#     t3();
	call t2
	.loc 2 65 0
	#     t4();
	call t3
	.loc 2 66 0
	#     t5();
	call t4
	.loc 2 67 0
	#     t6();
	call t5
	.loc 2 68 0
	#     t7();
	call t6
	.loc 2 69 0
	# }
	call t7
	leave
	ret
