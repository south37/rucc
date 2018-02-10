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
.global t1
t1:
	nop
	push %rbp
	mov %rsp, %rbp
	.file 2 "/home/vagrant/rucc/spec/targets/function.c"
	.loc 2 7 0
	# }
	mov $77, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
t2:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 11 0
	# }
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
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
	mov $79, %rax
	push %rax
	.loc 2 7 0
	# }
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	push %r9
	.loc 2 20 0
	# }
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
	mov $1, %rax
	push %rax
	.loc 2 11 0
	# }
	movslq -8(%rbp), %rax
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
	mov $2, %rax
	push %rax
	.loc 2 11 0
	# }
	movslq -16(%rbp), %rax
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
	mov $3, %rax
	push %rax
	.loc 2 11 0
	# }
	movslq -24(%rbp), %rax
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
	mov $4, %rax
	push %rax
	.loc 2 11 0
	# }
	movslq -32(%rbp), %rax
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
	mov $5, %rax
	push %rax
	.loc 2 11 0
	# }
	movslq -40(%rbp), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $6, %rax
	push %rax
	.loc 2 11 0
	# }
	movslq -48(%rbp), %rax
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
.global t4a
t4a:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 24 0
	# }
	.loc 2 20 0
	# }
	mov -8(%rbp), %rax
	movslq 0(%rax), %rax
	cltq
	cltq
	leave
	ret
	leave
	ret
	.text
t4:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 29 0
	# }
	.loc 2 28 0
	#     expect(98, t4a(a));
	movl $98, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L8:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L8(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $98, %rax
	push %rax
	push %rdi
	.loc 2 28 0
	#     expect(98, t4a(a));
	lea -8(%rbp), %rax
	push %rax
	pop %rdi
	call t4a
	pop %rdi
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
t5a:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 35 0
	# }
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
	mov $99, %rax
	push %rax
	.loc 2 29 0
	# }
	mov -8(%rbp), %rax
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
	.loc 2 33 0
	#     expect(98, *p); p=p+1;
	.loc 2 29 0
	# }
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 33 0
	#     expect(98, *p); p=p+1;
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L10:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L10(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $98, %rax
	push %rax
	.loc 2 29 0
	# }
	mov -8(%rbp), %rax
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
	.loc 2 34 0
	#     expect(97, *p);
	.loc 2 29 0
	# }
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 34 0
	#     expect(97, *p);
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L11:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L11(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $97, %rax
	push %rax
	.loc 2 29 0
	# }
	mov -8(%rbp), %rax
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
t5b:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 41 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L12:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L12(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $99, %rax
	push %rax
	.loc 2 35 0
	# }
	mov -8(%rbp), %rax
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
	.loc 2 39 0
	#     expect(98, *p); p=p+1;
	.loc 2 35 0
	# }
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 39 0
	#     expect(98, *p); p=p+1;
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L13:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L13(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $98, %rax
	push %rax
	.loc 2 35 0
	# }
	mov -8(%rbp), %rax
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
	.loc 2 40 0
	#     expect(97, *p);
	.loc 2 35 0
	# }
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 40 0
	#     expect(97, *p);
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L14:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L14(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $97, %rax
	push %rax
	.loc 2 35 0
	# }
	mov -8(%rbp), %rax
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
t5:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 51 0
	# }
	.loc 2 45 0
	#     int *p = a;
	movl $1, -16(%rbp)
	movl $2, -12(%rbp)
	movl $3, -8(%rbp)
	.loc 2 46 0
	#     *p = 99; p = p + 1;
	.loc 2 45 0
	#     int *p = a;
	lea -16(%rbp), %rax
	mov %rax, -24(%rbp)
	.loc 2 47 0
	#     *p = 98; p = p + 1;
	mov $99, %rax
	cltq
	push %rax
	.loc 2 46 0
	#     *p = 99; p = p + 1;
	mov -24(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 47 0
	#     *p = 98; p = p + 1;
	.loc 2 46 0
	#     *p = 99; p = p + 1;
	mov -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 47 0
	#     *p = 98; p = p + 1;
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -24(%rbp)
	.loc 2 48 0
	#     *p = 97;
	mov $98, %rax
	cltq
	push %rax
	.loc 2 46 0
	#     *p = 99; p = p + 1;
	mov -24(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 48 0
	#     *p = 97;
	.loc 2 46 0
	#     *p = 99; p = p + 1;
	mov -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 48 0
	#     *p = 97;
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -24(%rbp)
	.loc 2 49 0
	#     t5a(a);
	mov $97, %rax
	cltq
	push %rax
	.loc 2 46 0
	#     *p = 99; p = p + 1;
	mov -24(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 50 0
	#     t5b(a);
	push %rdi
	.loc 2 45 0
	#     int *p = a;
	lea -16(%rbp), %rax
	push %rax
	pop %rdi
	call t5a
	pop %rdi
	.loc 2 51 0
	# }
	push %rdi
	.loc 2 45 0
	#     int *p = a;
	lea -16(%rbp), %rax
	push %rax
	pop %rdi
	call t5b
	pop %rdi
	leave
	ret
	.text
.global t6
t6:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 56 0
	# }
	mov $3, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global t7
t7:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	.loc 2 61 0
	# }
	.loc 2 56 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	imul %rcx, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global t8
t8:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $176, %rsp
	mov %rdi, (%rsp)
	mov %rsi, 8(%rsp)
	mov %rdx, 16(%rsp)
	mov %rcx, 24(%rsp)
	mov %r8, 32(%rsp)
	mov %r9, 40(%rsp)
	movaps %xmm0, 48(%rsp)
	movaps %xmm1, 64(%rsp)
	movaps %xmm2, 80(%rsp)
	movaps %xmm3, 96(%rsp)
	movaps %xmm4, 112(%rsp)
	movaps %xmm5, 128(%rsp)
	movaps %xmm6, 144(%rsp)
	movaps %xmm7, 160(%rsp)
	push %rdi
	.loc 2 65 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L15:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L15(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $23, %rax
	push %rax
	.loc 2 61 0
	# }
	movslq -184(%rbp), %rax
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
t9:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 69 0
	# }
	leave
	ret
	leave
	ret
	.text
.global t10
t10:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 73 0
	# }
	.loc 2 69 0
	# }
	movslq -8(%rbp), %rax
	cvtsi2sd %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd -16(%rbp), %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	addsd %xmm1, %xmm0
	cvttsd2si %xmm0, %eax
	leave
	ret
	leave
	ret
	.text
.global ptrtest1
ptrtest1:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 77 0
	# }
	mov $55, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global ptrtest2
ptrtest2:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 81 0
	# }
	.loc 2 77 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 81 0
	# }
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	imul %rcx, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global ptrtest3
ptrtest3:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 85 0
	# }
	.loc 2 81 0
	# }
	movss -8(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 85 0
	# }
	mov $2, %rax
	cvtsi2ss %eax, %xmm0
	movss %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	mulss %xmm1, %xmm0
	leave
	ret
	leave
	ret
	.text
.global ptrtest4
ptrtest4:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	.loc 2 89 0
	# }
	push %rdi
	sub $8, %rsp
	.loc 2 85 0
	# }
	mov -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	push %rax
	pop %rdi
	pop %r11
	call *%r11
	add $8, %rsp
	pop %rdi
	cltq
	leave
	ret
	leave
	ret
	.text
func_ptr_call:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 102 0
	# }
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L16:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L16(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	mov $2, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call ptrtest3
	add $8, %rsp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 2 94 0
	#     expect(55, p1());
	lea ptrtest1(%rip), %rax
	mov %rax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L17:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L17(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $55, %rax
	push %rax
	sub $8, %rsp
	.loc 2 94 0
	#     expect(55, p1());
	mov -8(%rbp), %rax
	push %rax
	pop %r11
	call *%r11
	add $8, %rsp
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
	.loc 2 96 0
	#     expect(110, p2(55));
	lea ptrtest2(%rip), %rax
	mov %rax, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L18:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L18(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $110, %rax
	push %rax
	push %rdi
	.loc 2 96 0
	#     expect(110, p2(55));
	mov -16(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $55, %rax
	push %rax
	pop %rdi
	pop %r11
	call *%r11
	pop %rdi
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
	.loc 2 98 0
	#     expectf(4, p3(2));
	lea ptrtest3(%rip), %rax
	mov %rax, -24(%rbp)
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L19:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L19(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	.loc 2 98 0
	#     expectf(4, p3(2));
	mov -24(%rbp), %rax
	push %rax
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	mov $2, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %r11
	call *%r11
	add $8, %rsp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 2 100 0
	#     expect(55, (**p4)());
	lea ptrtest1(%rip), %rax
	mov %rax, -32(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L20:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L20(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $55, %rax
	push %rax
	sub $8, %rsp
	.loc 2 100 0
	#     expect(55, (**p4)());
	mov -32(%rbp), %rax
	push %rax
	pop %r11
	call *%r11
	add $8, %rsp
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L21:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L21(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	push %rdi
	push %rsi
	sub $8, %rsp
	lea ptrtest2(%rip), %rax
	push %rax
	mov $5, %rax
	push %rax
	pop %rsi
	pop %rdi
	call ptrtest4
	add $8, %rsp
	pop %rsi
	pop %rdi
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
func_name:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 107 0
	# }
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L22:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L22(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L23:
	.string "func_name"
.text
	lea .L23(%rip), %rax
	push %rax
	.loc 2 102 0
	# }
.data
	.L24:
	.string "func_name"
.text
	lea .L24(%rip), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L25:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L25(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L26:
	.string "func_name"
.text
	lea .L26(%rip), %rax
	push %rax
	.loc 2 102 0
	# }
	lea .L24(%rip), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.data 0
.S0.x:
	.long 1
	.data 0
.S1.y:
	.byte 50
	.byte 0
	.data
	.lcomm .S2.z, 4
	.text
local_static2:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 115 0
	# }
	.loc 2 114 0
	#     return x++ + (y[0] - '0') + z;
	mov $3, %rax
	cltq
	mov %eax, .S2.z+0(%rip)
	.loc 2 115 0
	# }
	.loc 2 111 0
	#     static char y[] = "2";
	movslq .S0.x+0(%rip), %rax
	push %rax
	add $1, %rax
	mov %eax, .S0.x+0(%rip)
	pop %rax
	push %rax
	.loc 2 115 0
	# }
	.loc 2 112 0
	#     static int z;
	lea .S1.y(%rip), %rax
	push %rcx
	push %rax
	.loc 2 115 0
	# }
	mov $0, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movsbq 0(%rax), %rax
	movsbq %al, %rax
	movsbq %al, %rax
	push %rax
	mov $48, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	.loc 2 113 0
	#     z = 3;
	movslq .S2.z+0(%rip), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	leave
	ret
	leave
	ret
	.data 0
.S3.x:
	.long 5
	.data 0
.S4.y:
	.byte 56
	.byte 0
	.data
	.lcomm .S5.z, 4
	.text
local_static3:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 122 0
	# }
	mov $100, %rax
	cltq
	mov %eax, .S5.z+0(%rip)
	leave
	ret
	.text
local_static:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 129 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L27:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L27(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	sub $8, %rsp
	call local_static2
	add $8, %rsp
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
	.L28:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L28(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	sub $8, %rsp
	call local_static2
	add $8, %rsp
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
	.loc 2 128 0
	#     expect(8, local_static2());
	call local_static3
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L29:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L29(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	push %rax
	sub $8, %rsp
	call local_static2
	add $8, %rsp
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
empty:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 129 0
	# }
	leave
	ret
	.text
empty2:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 136 0
	# }
	leave
	ret
	.text
.global booltest2
booltest2:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 142 0
	# }
	.loc 2 136 0
	# }
	movslq -8(%rbp), %rax
	cmp $0, %rax
	setne %al
	movzb %al, %eax
	movzx %al, %rax
	leave
	ret
	leave
	ret
	.text
test_bool:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 149 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L30:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L30(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	push %rdi
	mov $256, %rax
	push %rax
	pop %rdi
	call booltest1
	pop %rdi
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
	.L31:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L31(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	push %rdi
	mov $257, %rax
	push %rax
	pop %rdi
	call booltest1
	pop %rdi
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
	.L32:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L32(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	push %rdi
	mov $512, %rax
	push %rax
	pop %rdi
	call booltest2
	movzx %al, %rax
	pop %rdi
	movsbq %al, %rax
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
	.L33:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L33(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	push %rdi
	mov $513, %rax
	push %rax
	pop %rdi
	call booltest2
	movzx %al, %rax
	pop %rdi
	movsbq %al, %rax
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
.global sum
sum:
	nop
	push %rbp
	mov %rsp, %rbp
	lea 16(%rbp), %rax
	sub $16, %rsp
	mov %rcx, -8(%rsp)
	mov %r11, -16(%rsp)
	mov %rax, %rcx
	movq 0(%rcx), %r11
	mov %r11, 0(%rsp)
	movq 8(%rcx), %r11
	mov %r11, 8(%rsp)
	mov -8(%rsp), %rcx
	mov -16(%rsp), %r11
	.loc 2 155 0
	# }
	movslq -16(%rbp), %rax
	push %rax
	movslq -12(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq -8(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq -4(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
test_struct:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 159 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L34:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L34(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $14, %rax
	push %rax
	sub $8, %rsp
	movl $2, -16(%rbp)
	movl $3, -12(%rbp)
	movl $4, -8(%rbp)
	movl $5, -4(%rbp)
	lea -16(%rbp), %rax
	sub $16, %rsp
	mov %rcx, -8(%rsp)
	mov %r11, -16(%rsp)
	mov %rax, %rcx
	movq 0(%rcx), %r11
	mov %r11, 0(%rsp)
	movq 8(%rcx), %r11
	mov %r11, 8(%rsp)
	mov -8(%rsp), %rcx
	mov -16(%rsp), %r11
	call sum
	add $16, %rsp
	add $8, %rsp
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
test_funcdesg:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 163 0
	# }
	lea test_funcdesg(%rip), %rax
	leave
	ret
	.text
retfunc:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 169 0
	# }
	lea t6(%rip), %rax
	leave
	ret
	leave
	ret
	.text
retfunc2:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 173 0
	# }
	lea t6(%rip), %rax
	leave
	ret
	leave
	ret
	.data
	.lcomm char32, 1
	.text
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 204 0
	# }
	.loc 2 181 0
	# 
	push %rdi
	sub $8, %rsp
.data
	.L35:
	.string "function"
.text
	lea .L35(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L36:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L36(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $77, %rax
	push %rax
	sub $8, %rsp
	call t1
	add $8, %rsp
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
	.loc 2 184 0
	#     t3(1, 2, 3, 4, 5, 6);
	push %rdi
	sub $8, %rsp
	mov $79, %rax
	push %rax
	pop %rdi
	call t2
	add $8, %rsp
	pop %rdi
	.loc 2 185 0
	#     t4();
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	push %r9
	mov $1, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $3, %rax
	push %rax
	mov $4, %rax
	push %rax
	mov $5, %rax
	push %rax
	mov $6, %rax
	push %rax
	pop %r9
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call t3
	pop %r9
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 186 0
	#     t5();
	call t4
	.loc 2 187 0
	#     expect(3, t6());
	call t5
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L37:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L37(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	sub $8, %rsp
	call t6
	add $8, %rsp
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
	.L38:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L38(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12, %rax
	push %rax
	push %rdi
	push %rsi
	sub $8, %rsp
	mov $3, %rax
	push %rax
	mov $4, %rax
	push %rax
	pop %rsi
	pop %rdi
	call t7
	add $8, %rsp
	pop %rsi
	pop %rdi
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
	.L39:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L39(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $77, %rax
	push %rax
	sub $8, %rsp
	mov $1, %rax
	test %rax, %rax
	je .L40
	lea t1(%rip), %rax
	jmp .L41
	.L40:
	lea t6(%rip), %rax
	.L41:
	push %rax
	pop %r11
	call *%r11
	add $8, %rsp
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
	.L42:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L42(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	sub $8, %rsp
	mov $0, %rax
	test %rax, %rax
	je .L43
	lea t1(%rip), %rax
	jmp .L44
	.L43:
	lea t6(%rip), %rax
	.L44:
	push %rax
	pop %r11
	call *%r11
	add $8, %rsp
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
	.loc 2 192 0
	#     t9();
	push %rdi
	sub $8, %rsp
	mov $23, %rax
	push %rax
	pop %rdi
	mov $0, %eax
	call t8
	add $8, %rsp
	pop %rdi
	.loc 2 193 0
	#     expect(7, t10(3, 4.0));
	call t9
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L45:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L45(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	push %rdi
	mov $3, %rax
	push %rax
.data
	.L46:
	.quad 4616189618054758400
.text
	movsd .L46(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rdi
	call t10
	pop %rdi
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
	.loc 2 195 0
	#     func_name();
	call func_ptr_call
	.loc 2 196 0
	#     local_static();
	call func_name
	.loc 2 197 0
	#     empty();
	call local_static
	.loc 2 198 0
	#     empty2();
	call empty
	.loc 2 199 0
	#     test_bool();
	call empty2
	.loc 2 200 0
	#     test_struct();
	call test_bool
	.loc 2 201 0
	#     test_funcdesg();
	call test_struct
	.loc 2 202 0
	#     expect(3, retfunc()());
	call test_funcdesg
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L47:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L47(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	sub $8, %rsp
	call retfunc
	push %rax
	pop %r11
	call *%r11
	add $8, %rsp
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
	.L48:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L48(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	sub $8, %rsp
	call retfunc2
	push %rax
	pop %r11
	call *%r11
	add $8, %rsp
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
