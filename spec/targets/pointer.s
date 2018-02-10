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
	sub $16, %rsp
	.file 2 "/home/vagrant/rucc/spec/targets/pointer.c"
	.loc 2 8 0
	# }
	.loc 2 6 0
	#     int *b = &a;
	movl $61, -8(%rbp)
	.loc 2 7 0
	#     expect(61, *b);
	lea -8(%rbp), %rax
	mov %rax, -16(%rbp)
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
	mov $61, %rax
	push %rax
	.loc 2 7 0
	#     expect(61, *b);
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
t2:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 13 0
	# }
	.loc 2 12 0
	#     expect(97, *c);
.data
	.L1:
	.string "ab"
.text
	lea .L1(%rip), %rax
	mov %rax, -8(%rbp)
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
	mov $97, %rax
	push %rax
	.loc 2 12 0
	#     expect(97, *c);
	mov -8(%rbp), %rax
	movsbq 0(%rax), %rax
	movsbq %al, %rax
	movsbq %al, %rax
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
	sub $8, %rsp
	.loc 2 18 0
	# }
	.loc 2 17 0
	#     expect(98, *c);
.data
	.L3:
	.string "ab"
.text
	lea .L3(%rip), %rax
	push %rcx
	push %rax
	mov $1, %rax
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
	.L4:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L4(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $98, %rax
	push %rax
	.loc 2 17 0
	#     expect(98, *c);
	mov -8(%rbp), %rax
	movsbq 0(%rax), %rax
	movsbq %al, %rax
	movsbq %al, %rax
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
t4:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 24 0
	# }
	.loc 2 22 0
	#     char *c = s + 2;
	movb $120, -8(%rbp)
	movb $121, -7(%rbp)
	movb $122, -6(%rbp)
	movb $0, -5(%rbp)
	.loc 2 23 0
	#     expect(122, *c);
	.loc 2 22 0
	#     char *c = s + 2;
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 23 0
	#     expect(122, *c);
	mov $2, %rax
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
	.L5:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L5(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $122, %rax
	push %rax
	.loc 2 23 0
	#     expect(122, *c);
	mov -16(%rbp), %rax
	movsbq 0(%rax), %rax
	movsbq %al, %rax
	movsbq %al, %rax
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
	sub $8, %rsp
	.loc 2 30 0
	# }
	.loc 2 28 0
	#     *s = 65;
	movb $120, -8(%rbp)
	movb $121, -7(%rbp)
	movb $122, -6(%rbp)
	movb $0, -5(%rbp)
	.loc 2 29 0
	#     expect(65, *s);
	mov $65, %rax
	cltq
	movsbq %al, %rax
	push %rax
	.loc 2 28 0
	#     *s = 65;
	lea -8(%rbp), %rax
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
	.L6:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L6(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $65, %rax
	push %rax
	.loc 2 28 0
	#     *s = 65;
	lea -8(%rbp), %rax
	movsbq 0(%rax), %rax
	movsbq %al, %rax
	movsbq %al, %rax
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
	sub $56, %rsp
	.loc 2 46 0
	# }
	.loc 2 38 0
	#     struct tag node2 = { 2, &node1 };
	movl $0, -12(%rbp)
	movl $1, -16(%rbp)
	mov $0, %rax
	mov %rax, -8(%rbp)
	.loc 2 39 0
	#     struct tag node3 = { 3, &node2 };
	movl $0, -28(%rbp)
	movl $2, -32(%rbp)
	lea -16(%rbp), %rax
	mov %rax, -24(%rbp)
	.loc 2 40 0
	#     struct tag *p = &node3;
	movl $0, -44(%rbp)
	movl $3, -48(%rbp)
	lea -32(%rbp), %rax
	mov %rax, -40(%rbp)
	.loc 2 41 0
	#     expect(3, p->val);
	lea -48(%rbp), %rax
	mov %rax, -56(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L7:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L7(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 2 41 0
	#     expect(3, p->val);
	mov -56(%rbp), %rax
	movslq 0(%rax), %rax
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
	mov $2, %rax
	push %rax
	.loc 2 41 0
	#     expect(3, p->val);
	mov -56(%rbp), %rax
	mov 8(%rax), %rax
	movslq 0(%rax), %rax
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
	mov $1, %rax
	push %rax
	.loc 2 41 0
	#     expect(3, p->val);
	mov -56(%rbp), %rax
	mov 8(%rax), %rax
	mov 8(%rax), %rax
	movslq 0(%rax), %rax
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
	.loc 2 45 0
	#     expect(1, p->next->val);
	.loc 2 41 0
	#     expect(3, p->val);
	mov -56(%rbp), %rax
	mov 8(%rax), %rax
	mov 8(%rax), %rax
	push %rax
	mov -56(%rbp), %rax
	mov (%rsp), %rcx
	mov %rcx, 8(%rax)
	pop %rax
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
	mov $1, %rax
	push %rax
	.loc 2 41 0
	#     expect(3, p->val);
	mov -56(%rbp), %rax
	mov 8(%rax), %rax
	movslq 0(%rax), %rax
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
t7:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 53 0
	# }
	.loc 2 50 0
	#     int *p1 = &a + 1;
	.loc 2 51 0
	#     int *p2 = 1 + &a;
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -16(%rbp)
	.loc 2 52 0
	#     expect(0, p1 - p2);
	lea -8(%rbp), %rax
	push %rcx
	push %rax
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
	.L11:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L11(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 51 0
	#     int *p2 = 1 + &a;
	mov -16(%rbp), %rax
	push %rax
	.loc 2 52 0
	#     expect(0, p1 - p2);
	mov -24(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
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
subtract:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 60 0
	# }
	.loc 2 57 0
	#     char *q = p + 5;
.data
	.L12:
	.string "abcdefg"
.text
	lea .L12(%rip), %rax
	mov %rax, -8(%rbp)
	.loc 2 58 0
	#     expect(8, sizeof(q - p));
	.loc 2 57 0
	#     char *q = p + 5;
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 58 0
	#     expect(8, sizeof(q - p));
	mov $5, %rax
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
	.L13:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L13(%rip), %rax
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
	.L14:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L14(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	.loc 2 58 0
	#     expect(8, sizeof(q - p));
	mov -16(%rbp), %rax
	push %rax
	.loc 2 57 0
	#     char *q = p + 5;
	mov -8(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
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
compare:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 84 0
	# }
	.loc 2 64 0
	#     expect(0, p == p + 1);
.data
	.L15:
	.string "abcdefg"
.text
	lea .L15(%rip), %rax
	mov %rax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L16:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L16(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L17:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L17(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L18:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L18(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setne %al
	movzb %al, %eax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L19:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L19(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	pop %rcx
	cmp %eax, %ecx
	setne %al
	movzb %al, %eax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L20:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L20(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L21:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L21(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L22:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L22(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L23:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L23(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L24:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L24(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L25:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L25(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L26:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L26(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L27:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L27(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L28:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L28(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L29:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L29(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	push %rax
	.loc 2 64 0
	#     expect(0, p == p + 1);
	mov -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L30:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L30(%rip), %rax
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
	call fexpect@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L31:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L31(%rip), %rax
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
	call fexpect@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L32:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L32(%rip), %rax
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
	call fexpect@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L33:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L33(%rip), %rax
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
	call fexpect@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L34:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L34(%rip), %rax
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
	call fexpect@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L35:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L35(%rip), %rax
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
	.loc 2 97 0
	# }
	.loc 2 88 0
	#     t1();
	push %rdi
	sub $8, %rsp
.data
	.L36:
	.string "pointer"
.text
	lea .L36(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 89 0
	#     t2();
	call t1@PLT
	.loc 2 90 0
	#     t3();
	call t2@PLT
	.loc 2 91 0
	#     t4();
	call t3@PLT
	.loc 2 92 0
	#     t5();
	call t4@PLT
	.loc 2 93 0
	#     t6();
	call t5@PLT
	.loc 2 94 0
	#     t7();
	call t6@PLT
	.loc 2 95 0
	#     subtract();
	call t7@PLT
	.loc 2 96 0
	#     compare();
	call subtract@PLT
	.loc 2 97 0
	# }
	call compare@PLT
	leave
	ret
