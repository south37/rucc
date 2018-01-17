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
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.file 2 "/home/vagrant/rucc/spec/targets/assign.c"
	.loc 2 54 0
	# }
	.loc 2 6 0
	# 
	push %rdi
	sub $8, %rsp
.data
	.L0:
	.string "compound assignment"
.text
	lea .L0(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 2 8 0
	#     a += 5;
	movl $0, -8(%rbp)
	.loc 2 9 0
	#     expect(5, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 9 0
	#     expect(5, a);
	mov $5, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $5, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 11 0
	#     expect(3, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 11 0
	#     expect(3, a);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
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
	mov $3, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 13 0
	#     expect(30, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 13 0
	#     expect(30, a);
	mov $10, %rax
	mov %rax, %rcx
	pop %rax
	imul %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
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
	mov $30, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 15 0
	#     expect(15, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 15 0
	#     expect(15, a);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	cqto
	idiv %rcx
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
	mov $15, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 17 0
	#     expect(3, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 17 0
	#     expect(3, a);
	mov $6, %rax
	mov %rax, %rcx
	pop %rax
	cqto
	idiv %rcx
	mov %edx, %eax
	cltq
	mov %eax, -8(%rbp)
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
	mov $3, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 20 0
	#     a &= 7;
	mov $14, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 21 0
	#     expect(6, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 21 0
	#     expect(6, a);
	mov $7, %rax
	pop %rcx
	and %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
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
	mov $6, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 23 0
	#     expect(14, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 23 0
	#     expect(14, a);
	mov $8, %rax
	pop %rcx
	or %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
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
	mov $14, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 25 0
	#     expect(13, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 25 0
	#     expect(13, a);
	mov $3, %rax
	mov %rax, %rcx
	pop %rax
	xor %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
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
	mov $13, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 27 0
	#     expect(52, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 27 0
	#     expect(52, a);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
	cltq
	mov %eax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $52, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 29 0
	#     expect(13, a);
	.loc 2 8 0
	#     a += 5;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 29 0
	#     expect(13, a);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	sar %cl, %eax
	cltq
	mov %eax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L10:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L10(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $13, %rax
	push %rax
	.loc 2 8 0
	#     a += 5;
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
	.loc 2 32 0
	#     b += 5;
	mov $0, %rax
	cltq
	mov %al, -16(%rbp)
	.loc 2 33 0
	#     expect(5, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 33 0
	#     expect(5, b);
	mov $5, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
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
	mov $5, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 35 0
	#     expect(3, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 35 0
	#     expect(3, b);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L12:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L12(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 37 0
	#     expect(30, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 37 0
	#     expect(30, b);
	mov $10, %rax
	mov %rax, %rcx
	pop %rax
	imul %rcx, %rax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
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
	mov $30, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 39 0
	#     expect(15, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 39 0
	#     expect(15, b);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	cqto
	idiv %rcx
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $15, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 41 0
	#     expect(3, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 41 0
	#     expect(3, b);
	mov $6, %rax
	mov %rax, %rcx
	pop %rax
	cqto
	idiv %rcx
	mov %edx, %eax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L15:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L15(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 44 0
	#     b &= 7;
	mov $14, %rax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
	.loc 2 45 0
	#     expect(6, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 45 0
	#     expect(6, b);
	mov $7, %rax
	pop %rcx
	and %rcx, %rax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L16:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L16(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 47 0
	#     expect(14, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 47 0
	#     expect(14, b);
	mov $8, %rax
	pop %rcx
	or %rcx, %rax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
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
	mov $14, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 49 0
	#     expect(13, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 49 0
	#     expect(13, b);
	mov $3, %rax
	mov %rax, %rcx
	pop %rax
	xor %rcx, %rax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
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
	mov $13, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 51 0
	#     expect(52, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 51 0
	#     expect(52, b);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
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
	mov $52, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
	.loc 2 53 0
	#     expect(13, b);
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
	movsbq %al, %rax
	push %rax
	.loc 2 53 0
	#     expect(13, b);
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	sar %cl, %eax
	cltq
	movsbq %al, %rax
	mov %al, -16(%rbp)
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
	mov $13, %rax
	push %rax
	.loc 2 32 0
	#     b += 5;
	movsbq -16(%rbp), %rax
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
