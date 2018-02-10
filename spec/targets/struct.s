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
	.file 2 "/home/vagrant/rucc/spec/targets/struct.c"
	.loc 2 9 0
	# }
	.loc 2 7 0
	#     x.a = 61;
	.loc 2 8 0
	#     expect(61, x.a);
	mov $61, %rax
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
	mov $61, %rax
	push %rax
	movslq -8(%rbp), %rax
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
	sub $8, %rsp
	.loc 2 16 0
	# }
	.loc 2 13 0
	#     x.a = 61;
	.loc 2 14 0
	#     x.b = 2;
	mov $61, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 15 0
	#     expect(63, x.a + x.b);
	mov $2, %rax
	cltq
	mov %eax, -4(%rbp)
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
	mov $63, %rax
	push %rax
	movslq -8(%rbp), %rax
	push %rax
	movslq -4(%rbp), %rax
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
t3:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 24 0
	# }
	.loc 2 20 0
	#     x.a = 61;
	.loc 2 21 0
	#     x.y.b = 3;
	mov $61, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 22 0
	#     x.y.c = 3;
	mov $3, %rax
	cltq
	movsbq %al, %rax
	mov %al, -12(%rbp)
	.loc 2 23 0
	#     expect(67, x.a + x.y.b + x.y.c);
	mov $3, %rax
	cltq
	mov %eax, -8(%rbp)
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
	mov $67, %rax
	push %rax
	movslq -16(%rbp), %rax
	push %rax
	movsbq -12(%rbp), %rax
	movsbq %al, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq -8(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
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
	sub $32, %rsp
	.loc 2 33 0
	# }
	.loc 2 28 0
	#     struct tag4 s;
	.loc 2 29 0
	#     s.a = 61;
	.loc 2 30 0
	#     s.y.b = 3;
	mov $61, %rax
	cltq
	mov %eax, -32(%rbp)
	.loc 2 31 0
	#     s.y.c = 3;
	mov $3, %rax
	cltq
	movsbq %al, %rax
	mov %al, -28(%rbp)
	.loc 2 32 0
	#     expect(67, s.a + s.y.b + s.y.c);
	mov $3, %rax
	cltq
	mov %eax, -24(%rbp)
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
	movslq -32(%rbp), %rax
	push %rax
	movsbq -28(%rbp), %rax
	movsbq %al, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq -24(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
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
	sub $16, %rsp
	.loc 2 40 0
	# }
	.loc 2 37 0
	#     struct tag5 *p = &x;
	.loc 2 38 0
	#     x.a = 68;
	lea -8(%rbp), %rax
	mov %rax, -16(%rbp)
	.loc 2 39 0
	#     expect(68, (*p).a);
	mov $68, %rax
	cltq
	mov %eax, -8(%rbp)
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
	mov $68, %rax
	push %rax
	.loc 2 38 0
	#     x.a = 68;
	mov -16(%rbp), %rax
	movslq 0(%rax), %rax
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
t6:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 47 0
	# }
	.loc 2 44 0
	#     struct tag6 *p = &x;
	.loc 2 45 0
	#     (*p).a = 69;
	lea -8(%rbp), %rax
	mov %rax, -16(%rbp)
	.loc 2 46 0
	#     expect(69, x.a);
	mov $69, %rax
	cltq
	push %rax
	.loc 2 45 0
	#     (*p).a = 69;
	mov -16(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
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
	mov $69, %rax
	push %rax
	movslq -8(%rbp), %rax
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
t7:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 54 0
	# }
	.loc 2 51 0
	#     struct tag7 *p = &x;
	.loc 2 52 0
	#     x.b = 71;
	lea -8(%rbp), %rax
	mov %rax, -16(%rbp)
	.loc 2 53 0
	#     expect(71, (*p).b);
	mov $71, %rax
	cltq
	mov %eax, -4(%rbp)
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
	mov $71, %rax
	push %rax
	.loc 2 52 0
	#     x.b = 71;
	mov -16(%rbp), %rax
	movslq 4(%rax), %rax
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
t8:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 61 0
	# }
	.loc 2 58 0
	#     struct tag8 *p = &x;
	.loc 2 59 0
	#     (*p).b = 72;
	lea -8(%rbp), %rax
	mov %rax, -16(%rbp)
	.loc 2 60 0
	#     expect(72, x.b);
	mov $72, %rax
	cltq
	push %rax
	.loc 2 59 0
	#     (*p).b = 72;
	mov -16(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, 4(%rax)
	pop %rax
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
	mov $72, %rax
	push %rax
	movslq -4(%rbp), %rax
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
t9:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 70 0
	# }
	.loc 2 65 0
	#     x.a[0] = 73;
	.loc 2 66 0
	#     expect(73, x.a[0]);
	mov $73, %rax
	cltq
	push %rax
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	mov $0, %rax
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
	.L8:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L8(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $73, %rax
	push %rax
	lea -24(%rbp), %rax
	push %rcx
	push %rax
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
	call fexpect@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 68 0
	#     expect(74, x.b[1]);
	mov $74, %rax
	cltq
	push %rax
	lea -12(%rbp), %rax
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
	mov $74, %rax
	push %rax
	lea -12(%rbp), %rax
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
	.L10:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L10(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $74, %rax
	push %rax
	lea -24(%rbp), %rax
	push %rcx
	push %rax
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
	call fexpect@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.data
	.global v10
	.lcomm v10, 8
	.text
t10:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 84 0
	# }
	.loc 2 81 0
	#     v10.y.b = 3;
	mov $71, %rax
	cltq
	mov %eax, v10+0(%rip)
	.loc 2 82 0
	#     v10.y.c = 3;
	mov $3, %rax
	cltq
	movsbq %al, %rax
	mov %al, v10+4(%rip)
	.loc 2 83 0
	#     expect(77, v10.a + v10.y.b + v10.y.c);
	mov $3, %rax
	cltq
	mov %eax, v10+8(%rip)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L11:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L11(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $77, %rax
	push %rax
	movslq v10+0(%rip), %rax
	push %rax
	movsbq v10+4(%rip), %rax
	movsbq %al, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq v10+8(%rip), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
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
	.global v11
	.lcomm v11, 4
	.text
t11:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 97 0
	# }
	.loc 2 89 0
	#     v11.a = 78;
	lea v11(%rip), %rax
	mov %rax, -8(%rbp)
	.loc 2 90 0
	#     expect(78, (*p).a);
	mov $78, %rax
	cltq
	mov %eax, v11+0(%rip)
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
	mov $78, %rax
	push %rax
	.loc 2 89 0
	#     v11.a = 78;
	mov -8(%rbp), %rax
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
	.L13:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L13(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $78, %rax
	push %rax
	movslq v11+0(%rip), %rax
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
	.L14:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L14(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $78, %rax
	push %rax
	.loc 2 89 0
	#     v11.a = 78;
	mov -8(%rbp), %rax
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
	.loc 2 94 0
	#     expect(79, (*p).a);
	mov $79, %rax
	cltq
	push %rax
	.loc 2 89 0
	#     v11.a = 78;
	mov -8(%rbp), %rax
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
	.L15:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L15(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $79, %rax
	push %rax
	.loc 2 89 0
	#     v11.a = 78;
	mov -8(%rbp), %rax
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
	.L16:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L16(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $79, %rax
	push %rax
	movslq v11+0(%rip), %rax
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
	mov $79, %rax
	push %rax
	.loc 2 89 0
	#     v11.a = 78;
	mov -8(%rbp), %rax
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
	.data
	.global x
	.lcomm x, 8
	.text
t12:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 113 0
	# }
	.loc 2 105 0
	#     a[0].a = 83;
	.loc 2 106 0
	#     expect(83, a[0].a);
	mov $83, %rax
	cltq
	push %rax
	.loc 2 105 0
	#     a[0].a = 83;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 106 0
	#     expect(83, a[0].a);
	mov $0, %rax
	imul $8, %rax
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
.data
	.L18:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L18(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $83, %rax
	push %rax
	.loc 2 105 0
	#     a[0].a = 83;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $8, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
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
	.loc 2 108 0
	#     expect(84, a[0].b);
	mov $84, %rax
	cltq
	push %rax
	.loc 2 105 0
	#     a[0].a = 83;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 108 0
	#     expect(84, a[0].b);
	mov $0, %rax
	imul $8, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %ecx, 4(%rax)
	pop %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L19:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L19(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $84, %rax
	push %rax
	.loc 2 105 0
	#     a[0].a = 83;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $8, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 4(%rax), %rax
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
	.loc 2 110 0
	#     expect(85, a[1].b);
	mov $85, %rax
	cltq
	push %rax
	.loc 2 105 0
	#     a[0].a = 83;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 110 0
	#     expect(85, a[1].b);
	mov $1, %rax
	imul $8, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %ecx, 4(%rax)
	pop %rax
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
	mov $85, %rax
	push %rax
	.loc 2 105 0
	#     a[0].a = 83;
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $8, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 4(%rax), %rax
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
	.loc 2 112 0
	#     expect(85, p[3]);
	.loc 2 105 0
	#     a[0].a = 83;
	lea -24(%rbp), %rax
	mov %rax, -32(%rbp)
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
	mov $85, %rax
	push %rax
	.loc 2 112 0
	#     expect(85, p[3]);
	mov -32(%rbp), %rax
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
	call fexpect@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
t13:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 118 0
	# }
	.loc 2 117 0
	#     expect('a', v.c);
	movb $97, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $97, %rax
	push %rax
	movsbq -8(%rbp), %rax
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
t14:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 123 0
	# }
	.loc 2 122 0
	#     expect(2, v.a[1]);
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
	.L23:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L23(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	lea -16(%rbp), %rax
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
	call fexpect@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
unnamed:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 136 0
	# }
	.loc 2 127 0
	#         union {
	.loc 2 133 0
	#     v.y = 7;
	mov $1, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 134 0
	#     expect(1, v.c[0]);
	mov $7, %rax
	cltq
	mov %eax, -4(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $0, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
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
	mov $7, %rax
	push %rax
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
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
assign:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 151 0
	# }
	.loc 2 140 0
	#     v1.a = 3;
	.loc 2 141 0
	#     v1.b = 5;
	mov $3, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 142 0
	#     v1.c = 7;
	mov $5, %rax
	cltq
	mov %eax, -12(%rbp)
	.loc 2 143 0
	#     v1.d = 9;
	mov $7, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 144 0
	#     v1.f = 11;
	mov $9, %rax
	cltq
	movswq %ax, %rax
	mov %ax, -4(%rbp)
	.loc 2 145 0
	#     v2 = v1;
	mov $11, %rax
	cltq
	movsbq %al, %rax
	mov %al, -2(%rbp)
	.loc 2 146 0
	#     expect(3, v2.a);
	push %rcx
	push %r11
	lea -16(%rbp), %rax
	mov %rax, %rcx
	lea -32(%rbp), %rax
	movq 0(%rcx), %r11
	movq %r11, 0(%rax)
	movq 8(%rcx), %r11
	movq %r11, 8(%rax)
	pop %r11
	pop %rcx
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L26:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L26(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	movslq -32(%rbp), %rax
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
	.L27:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L27(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	movslq -28(%rbp), %rax
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
	.L28:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L28(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	movslq -24(%rbp), %rax
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
	.L29:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L29(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $9, %rax
	push %rax
	movswq -20(%rbp), %rax
	movswq %ax, %rax
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
	.L30:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L30(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	movsbq -18(%rbp), %rax
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
arrow:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $56, %rsp
	.loc 2 170 0
	# }
	.loc 2 156 0
	#     struct cell v2 = { 6, &v1 };
	movl $0, -12(%rbp)
	movl $5, -16(%rbp)
	mov $0, %rax
	mov %rax, -8(%rbp)
	.loc 2 157 0
	#     struct cell v3 = { 7, &v2 };
	movl $0, -28(%rbp)
	movl $6, -32(%rbp)
	lea -16(%rbp), %rax
	mov %rax, -24(%rbp)
	.loc 2 158 0
	#     struct cell *p = &v3;
	movl $0, -44(%rbp)
	movl $7, -48(%rbp)
	lea -32(%rbp), %rax
	mov %rax, -40(%rbp)
	.loc 2 159 0
	#     expect(7, v3.val);
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
	.L31:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L31(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	movslq -48(%rbp), %rax
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
	mov $7, %rax
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
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
	.L33:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L33(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
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
	.L34:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L34(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
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
	.loc 2 165 0
	#     p->next->val = 11;
	mov $10, %rax
	cltq
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
	mov -56(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 166 0
	#     p->next->next->val = 12;
	mov $11, %rax
	cltq
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
	mov -56(%rbp), %rax
	mov 8(%rax), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 2 167 0
	#     expect(10, p->val);
	mov $12, %rax
	cltq
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
	mov -56(%rbp), %rax
	mov 8(%rax), %rax
	mov 8(%rax), %rax
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
	.L35:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L35(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
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
	.L36:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L36(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
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
	.L37:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L37(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12, %rax
	push %rax
	.loc 2 159 0
	#     expect(7, v3.val);
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
	leave
	ret
	.text
address:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $48, %rsp
	.loc 2 188 0
	# }
	.loc 2 174 0
	#     int *p1 = &x.a;
	movl $6, -8(%rbp)
	movl $7, -4(%rbp)
	.loc 2 175 0
	#     int *p2 = &x.y.b;
	lea -8(%rbp), %rax
	add $0, %rax
	mov %rax, -16(%rbp)
	.loc 2 176 0
	#     expect(6, *p1);
	lea -8(%rbp), %rax
	add $4, %rax
	add $0, %rax
	mov %rax, -24(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $6, %rax
	push %rax
	.loc 2 175 0
	#     int *p2 = &x.y.b;
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $7, %rax
	push %rax
	.loc 2 176 0
	#     expect(6, *p1);
	mov -24(%rbp), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L40:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L40(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	lea -8(%rbp), %rax
	add $0, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L41:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L41(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	lea -8(%rbp), %rax
	add $4, %rax
	add $0, %rax
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
	.loc 2 182 0
	#     int *p3 = &xp->a;
	lea -8(%rbp), %rax
	mov %rax, -32(%rbp)
	.loc 2 183 0
	#     int *p4 = &xp->y.b;
	.loc 2 182 0
	#     int *p3 = &xp->a;
	mov -32(%rbp), %rax
	add $0, %rax
	mov %rax, -40(%rbp)
	.loc 2 184 0
	#     expect(6, *p3);
	.loc 2 182 0
	#     int *p3 = &xp->a;
	mov -32(%rbp), %rax
	add $4, %rax
	add $0, %rax
	mov %rax, -48(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $6, %rax
	push %rax
	.loc 2 183 0
	#     int *p4 = &xp->y.b;
	mov -40(%rbp), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L43:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L43(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	.loc 2 184 0
	#     expect(6, *p3);
	mov -48(%rbp), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $6, %rax
	push %rax
	.loc 2 182 0
	#     int *p3 = &xp->a;
	mov -32(%rbp), %rax
	add $0, %rax
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
	.loc 2 182 0
	#     int *p3 = &xp->a;
	mov -32(%rbp), %rax
	add $4, %rax
	add $0, %rax
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
incomplete:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 198 0
	# }
	.loc 2 196 0
	#     struct tag2 v2 = { &v1 };
	movl $3, -8(%rbp)
	.loc 2 197 0
	#     expect(3, v2.p->x);
	lea -8(%rbp), %rax
	mov %rax, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L46:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L46(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	mov -16(%rbp), %rax
	movslq 0(%rax), %rax
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
bitfield_basic:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 211 0
	# }
	.loc 2 202 0
	#         int i;
	.loc 2 206 0
	#     x.a = 10;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 207 0
	#     x.b = 11;
	mov $10, %rax
	cltq
	push %rcx
	push %rdi
	mov $0x1f, %rdi
	and %rdi, %rax
	shl $0, %rax
	mov -8(%rbp), %ecx
	mov $0xffffffe0, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %eax, -8(%rbp)
	.loc 2 208 0
	#     expect(10, x.a);
	mov $11, %rax
	cltq
	push %rcx
	push %rdi
	mov $0x1f, %rdi
	and %rdi, %rax
	shl $5, %rax
	mov -8(%rbp), %ecx
	mov $0xfffffc1f, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %eax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L47:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L47(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	movslq -8(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0x1f, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L48:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L48(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	movslq -8(%rbp), %rax
	shr $5, %rax
	push %rcx
	mov $0x1f, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L49:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L49(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $362, %rax
	push %rax
	movslq -8(%rbp), %rax
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
bitfield_mix:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 223 0
	# }
	.loc 2 215 0
	#         int i;
	.loc 2 219 0
	#     x.b = 11;
	mov $10, %rax
	cltq
	movsbq %al, %rax
	push %rcx
	push %rdi
	mov $0x1f, %rdi
	and %rdi, %rax
	shl $0, %rax
	mov -8(%rbp), %cl
	mov $0xffffffe0, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %al, -8(%rbp)
	.loc 2 220 0
	#     expect(10, x.a);
	mov $11, %rax
	cltq
	push %rcx
	push %rdi
	mov $0x1f, %rdi
	and %rdi, %rax
	shl $5, %rax
	mov -8(%rbp), %ecx
	mov $0xfffffc1f, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %eax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L50:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L50(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	movsbq -8(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0x1f, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L51:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L51(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	movslq -8(%rbp), %rax
	shr $5, %rax
	push %rcx
	mov $0x1f, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L52:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L52(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $362, %rax
	push %rax
	movslq -8(%rbp), %rax
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
bitfield_union:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 231 0
	# }
	.loc 2 227 0
	#     x.a = 2;
	.loc 2 228 0
	#     expect(2, x.a);
	mov $2, %rax
	cltq
	push %rcx
	push %rdi
	mov $0x3ff, %rdi
	and %rdi, %rax
	shl $0, %rax
	mov -8(%rbp), %ecx
	mov $0xfffffc00, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %eax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L53:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L53(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	movslq -8(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0x3ff, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L54:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L54(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	movsbq -8(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0x1f, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L55:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L55(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	movsbq -8(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0x1f, %rcx
	and %rcx, %rax
	pop %rcx
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
bitfield_unnamed:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 254 0
	# }
	.loc 2 235 0
	#         int i;
	movl $0, -8(%rbp)
	.loc 2 239 0
	#     x.a = 2;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 240 0
	#     x.b = 4;
	mov $2, %rax
	cltq
	movsbq %al, %rax
	push %rcx
	push %rdi
	mov $0xf, %rdi
	and %rdi, %rax
	shl $0, %rax
	mov -8(%rbp), %cl
	mov $0xfffffff0, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %al, -8(%rbp)
	.loc 2 241 0
	#     expect(2, x.a);
	mov $4, %rax
	cltq
	movsbq %al, %rax
	push %rcx
	push %rdi
	mov $0xf, %rdi
	and %rdi, %rax
	shl $4, %rax
	mov -8(%rbp), %cl
	mov $0xffffff0f, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %al, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L56:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L56(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	movsbq -8(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0xf, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L57:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L57(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	movsbq -8(%rbp), %rax
	shr $4, %rax
	push %rcx
	mov $0xf, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L58:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L58(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $66, %rax
	push %rax
	movslq -8(%rbp), %rax
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
	.loc 2 246 0
	#         int i;
	movl $0, -16(%rbp)
	.loc 2 250 0
	#     y.b = 4;
	mov $2, %rax
	cltq
	movsbq %al, %rax
	push %rcx
	push %rdi
	mov $0xf, %rdi
	and %rdi, %rax
	shl $0, %rax
	mov -16(%rbp), %cl
	mov $0xfffffff0, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %al, -16(%rbp)
	.loc 2 251 0
	#     expect(2, y.a);
	mov $4, %rax
	cltq
	movsbq %al, %rax
	push %rcx
	push %rdi
	mov $0xf, %rdi
	and %rdi, %rax
	shl $0, %rax
	mov -15(%rbp), %cl
	mov $0xfffffff0, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %al, -15(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L59:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L59(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	movsbq -16(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0xf, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L60:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L60(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	movsbq -15(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0xf, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L61:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L61(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1026, %rax
	push %rax
	movslq -16(%rbp), %rax
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
	.data 0
.global inittest
inittest:
	.byte 66
	.text
bitfield_initializer:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 265 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L62:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L62(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	movsbq inittest+0(%rip), %rax
	shr $0, %rax
	push %rcx
	mov $0xf, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L63:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L63(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	movsbq inittest+0(%rip), %rax
	shr $4, %rax
	push %rcx
	mov $0xf, %rcx
	and %rcx, %rax
	pop %rcx
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
	.loc 2 263 0
	#     expect(2, x.a);
	mov $2, %rax
	push %rcx
	push %rdi
	mov $0xf, %rdi
	and %rdi, %rax
	shl $0, %rax
	mov -8(%rbp), %cl
	mov $0xfffffff0, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %al, -8(%rbp)
	mov $4, %rax
	push %rcx
	push %rdi
	mov $0xf, %rdi
	and %rdi, %rax
	shl $4, %rax
	mov -8(%rbp), %cl
	mov $0xffffff0f, %rdi
	and %rdi, %rcx
	or %rcx, %rax
	pop %rdi
	pop %rcx
	mov %al, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L64:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L64(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	movsbq -8(%rbp), %rax
	shr $0, %rax
	push %rcx
	mov $0xf, %rcx
	and %rcx, %rax
	pop %rcx
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L65:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L65(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	movsbq -8(%rbp), %rax
	shr $4, %rax
	push %rcx
	mov $0xf, %rcx
	and %rcx, %rax
	pop %rcx
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
test_offsetof:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 284 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L66:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L66(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $0, %rax
	add $0, %rax
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
	.L67:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L67(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	mov $0, %rax
	add $4, %rax
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
	.loc 2 272 0
	#     expect(4, sizeof(x) / sizeof(x[0]));
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $4, %rax
	push %rax
	mov $16, %rax
	push %rax
	mov $4, %rax
	mov %rax, %rcx
	pop %rax
	xor %edx, %edx
	div %rcx
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
	.L69:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L69(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	mov $0, %rax
	add $4, %rax
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
	.L70:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L70(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	mov $0, %rax
	add $6, %rax
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
	.L71:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L71(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	mov $0, %rax
	add $6, %rax
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
	.L72:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L72(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	mov $0, %rax
	add $7, %rax
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
	.L73:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L73(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $0, %rax
	add $2, %rax
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
	.L74:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L74(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $0, %rax
	add $0, %rax
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
	.L75:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L75(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
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
	.L76:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L76(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $2, %rax
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
	.L77:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L77(%rip), %rax
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
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
flexible_member:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 302 0
	# #endif
	.loc 2 288 0
	#     expect(4, sizeof(x));
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L78:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L78(%rip), %rax
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
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 290 0
	#     expect(4, sizeof(y));
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L79:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L79(%rip), %rax
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
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 292 0
	#     expect(0, sizeof(z));
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L80:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L80(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $0, %rax
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
	.loc 2 297 0
	#     struct t x3 = { 1, 2, 3, 4, 5 };
	movl $1, -24(%rbp)
	movl $2, -20(%rbp)
	movl $3, -16(%rbp)
	.loc 2 298 0
	#     expect(2, x3.b[0]);
	movl $1, -32(%rbp)
	movl $2, -28(%rbp)
	movl $3, -24(%rbp)
	movl $4, -20(%rbp)
	movl $5, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L81:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L81(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	lea -28(%rbp), %rax
	push %rcx
	push %rax
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
	.L82:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L82(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	lea -28(%rbp), %rax
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
	.L83:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L83(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	lea -28(%rbp), %rax
	push %rcx
	push %rax
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
	.L84:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L84(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	lea -28(%rbp), %rax
	push %rcx
	push %rax
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
	call fexpect@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
empty_struct:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 310 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L85:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L85(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $0, %rax
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
	.L86:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L86(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $0, %rax
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
incdec_struct:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 330 0
	# }
	.loc 2 314 0
	# 	int x, y;
	movl $1, -16(%rbp)
	movl $2, -12(%rbp)
	movl $3, -8(%rbp)
	movl $4, -4(%rbp)
	lea -16(%rbp), %rax
	mov %rax, -24(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L87:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L87(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
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
	.L88:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L88(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	movslq 4(%rax), %rax
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
	.loc 2 319 0
	#     expect(3, p->x);
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	push %rax
	add $8, %rax
	mov %rax, -24(%rbp)
	pop %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L89:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L89(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
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
	.L90:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L90(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	movslq 4(%rax), %rax
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
	.loc 2 322 0
	#     expect(1, p->x);
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	push %rax
	sub $8, %rax
	mov %rax, -24(%rbp)
	pop %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L91:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L91(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
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
	.L92:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L92(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	movslq 4(%rax), %rax
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
	.loc 2 325 0
	#     expect(3, p->x);
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	add $8, %rax
	mov %rax, -24(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L93:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L93(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
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
	.L94:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L94(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	movslq 4(%rax), %rax
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
	.loc 2 328 0
	#     expect(1, p->x);
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	sub $8, %rax
	mov %rax, -24(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L95:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L95(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
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
	.L96:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L96(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	.loc 2 314 0
	# 	int x, y;
	mov -24(%rbp), %rax
	movslq 4(%rax), %rax
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
	.loc 2 360 0
	# }
	.loc 2 334 0
	#     t1();
	push %rdi
	sub $8, %rsp
.data
	.L97:
	.string "struct"
.text
	lea .L97(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 335 0
	#     t2();
	call t1@PLT
	.loc 2 336 0
	#     t3();
	call t2@PLT
	.loc 2 337 0
	#     t4();
	call t3@PLT
	.loc 2 338 0
	#     t5();
	call t4@PLT
	.loc 2 339 0
	#     t6();
	call t5@PLT
	.loc 2 340 0
	#     t7();
	call t6@PLT
	.loc 2 341 0
	#     t8();
	call t7@PLT
	.loc 2 342 0
	#     t9();
	call t8@PLT
	.loc 2 343 0
	#     t10();
	call t9@PLT
	.loc 2 344 0
	#     t11();
	call t10@PLT
	.loc 2 345 0
	#     t12();
	call t11@PLT
	.loc 2 346 0
	#     t13();
	call t12@PLT
	.loc 2 347 0
	#     t14();
	call t13@PLT
	.loc 2 348 0
	#     unnamed();
	call t14@PLT
	.loc 2 349 0
	#     assign();
	call unnamed@PLT
	.loc 2 350 0
	#     arrow();
	call assign@PLT
	.loc 2 351 0
	#     incomplete();
	call arrow@PLT
	.loc 2 352 0
	#     bitfield_basic();
	call incomplete@PLT
	.loc 2 353 0
	#     bitfield_mix();
	call bitfield_basic@PLT
	.loc 2 354 0
	#     bitfield_union();
	call bitfield_mix@PLT
	.loc 2 355 0
	#     bitfield_unnamed();
	call bitfield_union@PLT
	.loc 2 356 0
	#     bitfield_initializer();
	call bitfield_unnamed@PLT
	.loc 2 357 0
	#     test_offsetof();
	call bitfield_initializer@PLT
	.loc 2 358 0
	#     flexible_member();
	call test_offsetof@PLT
	.loc 2 359 0
	#     empty_struct();
	call flexible_member@PLT
	.loc 2 360 0
	# }
	call empty_struct@PLT
	leave
	ret
