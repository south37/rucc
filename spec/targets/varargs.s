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
test_builtin:
	nop
	push %rbp
	mov %rsp, %rbp
	.file 2 "/home/vagrant/rucc/spec/targets/varargs.c"
	.loc 2 10 0
	# #endif
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
	mov $0, %rax
	push %rax
	mov $0, %eax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L1:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L1(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %eax
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
	mov $2, %rax
	push %rax
	mov $2, %eax
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
test_int:
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
	sub $56, %rsp
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	.loc 2 15 0
	#     va_start(ap, a);
	.loc 1 36 0
	# #define va_arg(ap, type)                                \
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rcx
	movl $8, (%rax)
	movl $48, 4(%rax)
	lea -176(%rbp), %rcx
	mov %rcx, 16(%rax)
	pop %rcx
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
	.loc 2 10 0
	# #endif
	movslq -184(%rbp), %rax
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
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $0, %eax
	mov %eax, -216(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -216(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L5
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L6
	.L5:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -216(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L7
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L8
	.L7:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L8:
	.L6:
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
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
.data
	.L9:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L9(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $0, %eax
	mov %eax, -224(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -224(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L10
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L11
	.L10:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -224(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L12
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L13
	.L12:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L13:
	.L11:
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
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
.data
	.L14:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L14(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $0, %eax
	mov %eax, -232(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -232(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L15
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L16
	.L15:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -232(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L17
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L18
	.L17:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L18:
	.L16:
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
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
.data
	.L19:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L19(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $0, %eax
	mov %eax, -240(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -240(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L20
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L21
	.L20:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -240(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L22
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L23
	.L22:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 15 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L23:
	.L21:
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
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	mov $1, %rax
	leave
	ret
	.text
test_float:
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
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $48, %rsp
	.loc 2 26 0
	#     va_start(ap, a);
	.loc 1 36 0
	# #define va_arg(ap, type)                                \
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rcx
	movl $0, (%rax)
	movl $64, 4(%rax)
	lea -176(%rbp), %rcx
	mov %rcx, 16(%rax)
	pop %rcx
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L24:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L24(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L25:
	.quad 4607182418800017408
.text
	movsd .L25(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	movss -184(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf@PLT
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
.data
	.L26:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L26(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L27:
	.quad 4611686018427387904
.text
	movsd .L27(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $1, %eax
	mov %eax, -216(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -216(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L28
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L29
	.L28:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -216(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L30
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L31
	.L30:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L31:
	.L29:
	movsd 0(%rax), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd@PLT
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
.data
	.L32:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L32(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L33:
	.quad 4616189618054758400
.text
	movsd .L33(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $1, %eax
	mov %eax, -224(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -224(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L34
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L35
	.L34:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -224(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L36
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L37
	.L36:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L37:
	.L35:
	movsd 0(%rax), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd@PLT
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
.data
	.L38:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L38(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L39:
	.quad 4620693217682128896
.text
	movsd .L39(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $1, %eax
	mov %eax, -232(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -232(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L40
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L41
	.L40:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -232(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L42
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L43
	.L42:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 26 0
	#     va_start(ap, a);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L43:
	.L41:
	movsd 0(%rax), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd@PLT
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	mov $1, %rax
	leave
	ret
	.text
test_mix:
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
	sub $56, %rsp
	.loc 2 36 0
	#     va_start(ap, p);
	.loc 1 36 0
	# #define va_arg(ap, type)                                \
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rcx
	movl $8, (%rax)
	movl $48, 4(%rax)
	lea -176(%rbp), %rcx
	mov %rcx, 16(%rax)
	pop %rcx
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L44:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L44(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L45:
	.string "abc"
.text
	lea .L45(%rip), %rax
	push %rax
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	mov -184(%rbp), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
.data
	.L46:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L46(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L47:
	.quad 4611686018427387904
.text
	movsd .L47(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $1, %eax
	mov %eax, -216(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -216(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L48
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L49
	.L48:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -216(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L50
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L51
	.L50:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L51:
	.L49:
	movsd 0(%rax), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd@PLT
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
.data
	.L52:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L52(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $0, %eax
	mov %eax, -224(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -224(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L53
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L54
	.L53:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -224(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L55
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L56
	.L55:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L56:
	.L54:
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
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
.data
	.L57:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L57(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L58:
	.string "d"
.text
	lea .L58(%rip), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $0, %eax
	mov %eax, -232(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -232(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L59
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L60
	.L59:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -232(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L61
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L62
	.L61:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L62:
	.L60:
	mov 0(%rax), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
.data
	.L63:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L63(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	mov $0, %eax
	mov %eax, -240(%rbp)
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -240(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L64
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_gp@PLT
	pop %rdi
	jmp .L65
	.L64:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	.loc 1 39 0
	#         *(type *)(klass == 0 ? __va_arg_gp(ap) :        \
	movslq -240(%rbp), %rax
	push %rax
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L66
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_fp@PLT
	pop %rdi
	jmp .L67
	.L66:
	.loc 1 40 0
	#                   klass == 1 ? __va_arg_fp(ap) :        \
	push %rdi
	.loc 2 36 0
	#     va_start(ap, p);
	lea -208(%rbp), %rax
	push %rax
	pop %rdi
	call __va_arg_mem@PLT
	pop %rdi
	.L67:
	.L65:
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
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	mov $1, %rax
	leave
	ret
	.data
	.lcomm .S0.buf, 100
	.text
.global fmt
fmt:
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
	sub $24, %rsp
	.loc 2 52 0
	# }
	.loc 2 48 0
	#     va_start(ap, fmt);
	.loc 1 36 0
	# #define va_arg(ap, type)                                \
	.loc 2 48 0
	#     va_start(ap, fmt);
	lea -208(%rbp), %rax
	push %rcx
	movl $8, (%rax)
	movl $48, 4(%rax)
	lea -176(%rbp), %rcx
	mov %rcx, 16(%rax)
	pop %rcx
	.loc 2 50 0
	#     va_end(ap);
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
	.loc 2 47 0
	#     va_list ap;
	lea .S0.buf(%rip), %rax
	push %rax
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	mov -184(%rbp), %rax
	push %rax
	.loc 2 50 0
	#     va_end(ap);
	.loc 2 48 0
	#     va_start(ap, fmt);
	lea -208(%rbp), %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call vsprintf@PLT
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	mov $1, %rax
	.loc 2 52 0
	# }
	.loc 2 47 0
	#     va_list ap;
	lea .S0.buf(%rip), %rax
	leave
	ret
	leave
	ret
	.text
test_va_list:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 58 0
	# }
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L68:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L68(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L69:
	.string ""
.text
	lea .L69(%rip), %rax
	push %rax
	push %rdi
.data
	.L70:
	.string ""
.text
	lea .L70(%rip), %rax
	push %rax
	pop %rdi
	mov $0, %eax
	call fmt@PLT
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L71:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L71(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L72:
	.string "3"
.text
	lea .L72(%rip), %rax
	push %rax
	push %rdi
	push %rsi
	sub $8, %rsp
.data
	.L73:
	.string "%d"
.text
	lea .L73(%rip), %rax
	push %rax
	mov $3, %rax
	push %rax
	pop %rsi
	pop %rdi
	mov $0, %eax
	call fmt@PLT
	add $8, %rsp
	pop %rsi
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L74:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L74(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L75:
	.string "3,1.0,6,2.0,abc"
.text
	lea .L75(%rip), %rax
	push %rax
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L76:
	.string "%d,%.1f,%d,%.1f,%s"
.text
	lea .L76(%rip), %rax
	push %rax
	mov $3, %rax
	push %rax
	mov $6, %rax
	push %rax
.data
	.L77:
	.string "abc"
.text
	lea .L77(%rip), %rax
	push %rax
.data
	.L78:
	.quad 4607182418800017408
.text
	movsd .L78(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L79:
	.quad 4611686018427387904
.text
	movsd .L79(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	mov $2, %eax
	call fmt@PLT
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string@PLT
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
	.loc 2 67 0
	# }
	.loc 2 62 0
	#     test_builtin();
	push %rdi
	sub $8, %rsp
.data
	.L80:
	.string "varargs"
.text
	lea .L80(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 63 0
	#     test_int(1, 2, 3, 5, 8);
	call test_builtin@PLT
	.loc 2 64 0
	#     test_float(1.0, 2.0, 4.0, 8.0);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	sub $8, %rsp
	mov $1, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $3, %rax
	push %rax
	mov $5, %rax
	push %rax
	mov $8, %rax
	push %rax
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	mov $0, %eax
	call test_int@PLT
	add $8, %rsp
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 65 0
	#     test_mix("abc", 2.0, 4, "d", 5);
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
	movsd %xmm2, (%rsp)
	sub $8, %rsp
	movsd %xmm3, (%rsp)
	sub $8, %rsp
.data
	.L81:
	.quad 4607182418800017408
.text
	movsd .L81(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L82:
	.quad 4611686018427387904
.text
	movsd .L82(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L83:
	.quad 4616189618054758400
.text
	movsd .L83(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L84:
	.quad 4620693217682128896
.text
	movsd .L84(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm3
	add $8, %rsp
	movsd (%rsp), %xmm2
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	mov $4, %eax
	call test_float@PLT
	add $8, %rsp
	movsd (%rsp), %xmm3
	add $8, %rsp
	movsd (%rsp), %xmm2
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	.loc 2 66 0
	#     test_va_list();
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L85:
	.string "abc"
.text
	lea .L85(%rip), %rax
	push %rax
	mov $4, %rax
	push %rax
.data
	.L86:
	.string "d"
.text
	lea .L86(%rip), %rax
	push %rax
	mov $5, %rax
	push %rax
.data
	.L87:
	.quad 4611686018427387904
.text
	movsd .L87(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	mov $1, %eax
	call test_mix@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 67 0
	# }
	call test_va_list@PLT
	leave
	ret
