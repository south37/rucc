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
verify:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
	.file 2 "/home/vagrant/rucc/spec/targets/initializer.c"
	.loc 2 7 0
	# }
	.loc 2 6 0
	#         expect(expected[i], got[i]);
	movl $0, -32(%rbp)
	.L0:
	movslq -32(%rbp), %rax
	push %rax
	.loc 1 33 0
	# }
	movslq -24(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L7
	jmp .L8
	.L7:
	.loc 2 6 0
	#         expect(expected[i], got[i]);
	jmp .L2
	.L8:
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
	.loc 1 33 0
	# }
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 6 0
	#         expect(expected[i], got[i]);
	movslq -32(%rbp), %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movslq 0(%rax), %rax
	cltq
	push %rax
	.loc 1 33 0
	# }
	mov -16(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 6 0
	#         expect(expected[i], got[i]);
	movslq -32(%rbp), %rax
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
	.L1:
	movslq -32(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -32(%rbp)
	pop %rax
	jmp .L0
	.L2:
	leave
	ret
	.text
verify_short:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
	.loc 2 12 0
	# }
	.loc 2 11 0
	#         expect(expected[i], got[i]);
	movl $0, -32(%rbp)
	.L3:
	movslq -32(%rbp), %rax
	push %rax
	.loc 2 7 0
	# }
	movslq -24(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L10
	jmp .L11
	.L10:
	.loc 2 11 0
	#         expect(expected[i], got[i]);
	jmp .L5
	.L11:
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
	.loc 2 7 0
	# }
	mov -8(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 11 0
	#         expect(expected[i], got[i]);
	movslq -32(%rbp), %rax
	imul $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movswq 0(%rax), %rax
	movswq %ax, %rax
	movswq %ax, %rax
	push %rax
	.loc 2 7 0
	# }
	mov -16(%rbp), %rax
	push %rcx
	push %rax
	.loc 2 11 0
	#         expect(expected[i], got[i]);
	movslq -32(%rbp), %rax
	imul $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	movswq 0(%rax), %rax
	movswq %ax, %rax
	movswq %ax, %rax
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
	.L4:
	movslq -32(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -32(%rbp)
	pop %rax
	jmp .L3
	.L5:
	leave
	ret
	.text
test_array:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $360, %rsp
	.loc 2 36 0
	# }
	.loc 2 16 0
	#     expect(1, x[0]);
	movl $1, -16(%rbp)
	movl $3, -12(%rbp)
	movl $5, -8(%rbp)
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
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
	mov $1, %rax
	push %rax
	.loc 2 16 0
	#     expect(1, x[0]);
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
	mov $3, %rax
	push %rax
	.loc 2 16 0
	#     expect(1, x[0]);
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
	.L15:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L15(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	.loc 2 16 0
	#     expect(1, x[0]);
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
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 21 0
	#     int y1[4][3] = { { 1, 3, 5 }, { 2, 4, 6 }, { 3, 5, 7 }, };
	movl $1, -64(%rbp)
	movl $3, -60(%rbp)
	movl $5, -56(%rbp)
	movl $2, -52(%rbp)
	movl $4, -48(%rbp)
	movl $6, -44(%rbp)
	movl $3, -40(%rbp)
	movl $5, -36(%rbp)
	movl $7, -32(%rbp)
	movl $0, -28(%rbp)
	movl $0, -24(%rbp)
	movl $0, -20(%rbp)
	.loc 2 22 0
	#     verify(ye, y1, 12);
	movl $0, -76(%rbp)
	movl $0, -72(%rbp)
	movl $0, -68(%rbp)
	movl $1, -112(%rbp)
	movl $3, -108(%rbp)
	movl $5, -104(%rbp)
	movl $2, -100(%rbp)
	movl $4, -96(%rbp)
	movl $6, -92(%rbp)
	movl $3, -88(%rbp)
	movl $5, -84(%rbp)
	movl $7, -80(%rbp)
	.loc 2 23 0
	#     int y2[4][3] = { 1, 3, 5, 2, 4, 6, 3, 5, 7 };
	push %rdi
	push %rsi
	push %rdx
	.loc 2 21 0
	#     int y1[4][3] = { { 1, 3, 5 }, { 2, 4, 6 }, { 3, 5, 7 }, };
	lea -64(%rbp), %rax
	push %rax
	.loc 2 23 0
	#     int y2[4][3] = { 1, 3, 5, 2, 4, 6, 3, 5, 7 };
	.loc 2 22 0
	#     verify(ye, y1, 12);
	lea -112(%rbp), %rax
	push %rax
	.loc 2 23 0
	#     int y2[4][3] = { 1, 3, 5, 2, 4, 6, 3, 5, 7 };
	mov $12, %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call verify
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 24 0
	#     verify(ye, y2, 12);
	movl $0, -124(%rbp)
	movl $0, -120(%rbp)
	movl $0, -116(%rbp)
	movl $1, -160(%rbp)
	movl $3, -156(%rbp)
	movl $5, -152(%rbp)
	movl $2, -148(%rbp)
	movl $4, -144(%rbp)
	movl $6, -140(%rbp)
	movl $3, -136(%rbp)
	movl $5, -132(%rbp)
	movl $7, -128(%rbp)
	.loc 2 25 0
	# 
	push %rdi
	push %rsi
	push %rdx
	.loc 2 21 0
	#     int y1[4][3] = { { 1, 3, 5 }, { 2, 4, 6 }, { 3, 5, 7 }, };
	lea -64(%rbp), %rax
	push %rax
	.loc 2 25 0
	# 
	.loc 2 24 0
	#     verify(ye, y2, 12);
	lea -160(%rbp), %rax
	push %rax
	.loc 2 25 0
	# 
	mov $12, %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call verify
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 27 0
	#     int z[4][3] = { { 1 }, { 2 }, { 3 }, { 4 } };
	movl $1, -208(%rbp)
	movl $0, -204(%rbp)
	movl $0, -200(%rbp)
	movl $2, -196(%rbp)
	movl $0, -192(%rbp)
	movl $0, -188(%rbp)
	movl $3, -184(%rbp)
	movl $0, -180(%rbp)
	movl $0, -176(%rbp)
	movl $4, -172(%rbp)
	movl $0, -168(%rbp)
	movl $0, -164(%rbp)
	.loc 2 28 0
	#     verify(ze, z, 12);
	movl $0, -252(%rbp)
	movl $0, -248(%rbp)
	movl $0, -240(%rbp)
	movl $0, -236(%rbp)
	movl $0, -228(%rbp)
	movl $0, -224(%rbp)
	movl $0, -216(%rbp)
	movl $0, -212(%rbp)
	movl $1, -256(%rbp)
	movl $2, -244(%rbp)
	movl $3, -232(%rbp)
	movl $4, -220(%rbp)
	.loc 2 29 0
	# 
	push %rdi
	push %rsi
	push %rdx
	.loc 2 27 0
	#     int z[4][3] = { { 1 }, { 2 }, { 3 }, { 4 } };
	lea -208(%rbp), %rax
	push %rax
	.loc 2 29 0
	# 
	.loc 2 28 0
	#     verify(ze, z, 12);
	lea -256(%rbp), %rax
	push %rax
	.loc 2 29 0
	# 
	mov $12, %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call verify
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 31 0
	#     short q[4][3][2] = { { 1 }, { 2, 3 }, { 4, 5, 6 } };
	movl $0, -274(%rbp)
	movl $0, -270(%rbp)
	movl $0, -266(%rbp)
	movl $0, -262(%rbp)
	movb $0, -258(%rbp)
	movb $0, -257(%rbp)
	movw $1, -304(%rbp)
	movw $0, -302(%rbp)
	movw $0, -300(%rbp)
	movw $0, -298(%rbp)
	movw $0, -296(%rbp)
	movw $0, -294(%rbp)
	movw $2, -292(%rbp)
	movw $3, -290(%rbp)
	movw $0, -288(%rbp)
	movw $0, -286(%rbp)
	movw $0, -284(%rbp)
	movw $0, -282(%rbp)
	movw $4, -280(%rbp)
	movw $5, -278(%rbp)
	movw $6, -276(%rbp)
	.loc 2 32 0
	#     verify_short(qe, q, 24);
	movl $0, -350(%rbp)
	movl $0, -346(%rbp)
	movb $0, -342(%rbp)
	movb $0, -341(%rbp)
	movl $0, -336(%rbp)
	movl $0, -332(%rbp)
	movl $0, -322(%rbp)
	movl $0, -318(%rbp)
	movl $0, -314(%rbp)
	movl $0, -310(%rbp)
	movb $0, -306(%rbp)
	movb $0, -305(%rbp)
	movw $1, -352(%rbp)
	movw $2, -340(%rbp)
	movw $3, -338(%rbp)
	movw $4, -328(%rbp)
	movw $5, -326(%rbp)
	movw $6, -324(%rbp)
	.loc 2 33 0
	# 
	push %rdi
	push %rsi
	push %rdx
	.loc 2 31 0
	#     short q[4][3][2] = { { 1 }, { 2, 3 }, { 4, 5, 6 } };
	lea -304(%rbp), %rax
	push %rax
	.loc 2 33 0
	# 
	.loc 2 32 0
	#     verify_short(qe, q, 24);
	lea -352(%rbp), %rax
	push %rax
	.loc 2 33 0
	# 
	mov $24, %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call verify_short
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 35 0
	#     expect(3, a[0]);
	movl $3, -360(%rbp)
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
	mov $3, %rax
	push %rax
	.loc 2 35 0
	#     expect(3, a[0]);
	lea -360(%rbp), %rax
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
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
test_string:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 43 0
	# }
	.loc 2 40 0
	#     expect_string("abc", s);
	movb $97, -8(%rbp)
	movb $98, -7(%rbp)
	movb $99, -6(%rbp)
	movb $0, -5(%rbp)
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L18:
	.string "abc"
.text
	lea .L18(%rip), %rax
	push %rax
	.loc 2 40 0
	#     expect_string("abc", s);
	lea -8(%rbp), %rax
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
	.loc 2 42 0
	#     expect_string("def", t);
	movb $100, -16(%rbp)
	movb $101, -15(%rbp)
	movb $102, -14(%rbp)
	movb $0, -13(%rbp)
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L20:
	.string "def"
.text
	lea .L20(%rip), %rax
	push %rax
	.loc 2 42 0
	#     expect_string("def", t);
	lea -16(%rbp), %rax
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
	.text
test_struct:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $64, %rsp
	.loc 2 49 0
	# }
	.loc 2 47 0
	#     struct { int a[3]; int b; } w[] = { { 1 }, 2 };
	movl $1, -32(%rbp)
	movl $0, -28(%rbp)
	movl $0, -24(%rbp)
	movl $0, -20(%rbp)
	movl $2, -16(%rbp)
	movl $0, -12(%rbp)
	movl $0, -8(%rbp)
	movl $0, -4(%rbp)
	.loc 2 48 0
	#     verify(we, &w, 8);
	movl $0, -60(%rbp)
	movl $0, -56(%rbp)
	movl $0, -52(%rbp)
	movl $0, -44(%rbp)
	movl $0, -40(%rbp)
	movl $0, -36(%rbp)
	movl $1, -64(%rbp)
	movl $2, -48(%rbp)
	.loc 2 49 0
	# }
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
	.loc 2 47 0
	#     struct { int a[3]; int b; } w[] = { { 1 }, 2 };
	lea -32(%rbp), %rax
	push %rax
	.loc 2 49 0
	# }
	lea -64(%rbp), %rax
	push %rax
	mov $8, %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call verify
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
test_primitive:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 54 0
	# }
	.loc 2 53 0
	#     expect(59, a);
	movl $59, -8(%rbp)
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
	mov $59, %rax
	push %rax
	.loc 2 53 0
	#     expect(59, a);
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
test_nested:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 67 0
	# }
	.loc 2 58 0
	#         struct {
	movl $1, -16(%rbp)
	movl $2, -12(%rbp)
	movb $3, -8(%rbp)
	movb $4, -7(%rbp)
	movb $5, -6(%rbp)
	movb $6, -5(%rbp)
	movb $7, -4(%rbp)
	movb $8, -3(%rbp)
	movb $9, -2(%rbp)
	movb $10, -1(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $1, %rax
	push %rax
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
	movslq -12(%rbp), %rax
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
	.L24:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L24(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
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
	.L25:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L25(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	lea -8(%rbp), %rax
	push %rcx
	push %rax
	mov $7, %rax
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
	call fexpect
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
test_array_designator:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $64, %rsp
	.loc 2 93 0
	# }
	.loc 2 71 0
	#     expect(0, v[0]);
	movl $0, -16(%rbp)
	movl $0, -8(%rbp)
	movl $5, -12(%rbp)
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
	mov $0, %rax
	push %rax
	.loc 2 71 0
	#     expect(0, v[0]);
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
	.L27:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L27(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	.loc 2 71 0
	#     expect(0, v[0]);
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
	.L28:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L28(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 71 0
	#     expect(0, v[0]);
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
	.loc 2 76 0
	#     expect(0, x[0].a);
	movl $0, -32(%rbp)
	movl $0, -28(%rbp)
	movl $1, -24(%rbp)
	movl $2, -20(%rbp)
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
	mov $0, %rax
	push %rax
	.loc 2 76 0
	#     expect(0, x[0].a);
	lea -32(%rbp), %rax
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
	.L30:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L30(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 76 0
	#     expect(0, x[0].a);
	lea -32(%rbp), %rax
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
	.loc 2 76 0
	#     expect(0, x[0].a);
	lea -32(%rbp), %rax
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
	movslq 0(%rax), %rax
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
	mov $2, %rax
	push %rax
	.loc 2 76 0
	#     expect(0, x[0].a);
	lea -32(%rbp), %rax
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
	call fexpect
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 82 0
	#     expect(0, x2[0].a);
	movl $0, -56(%rbp)
	movl $0, -52(%rbp)
	movl $1, -48(%rbp)
	movl $2, -44(%rbp)
	movl $3, -40(%rbp)
	movl $4, -36(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $0, %rax
	push %rax
	.loc 2 82 0
	#     expect(0, x2[0].a);
	lea -56(%rbp), %rax
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
	.L34:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L34(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 82 0
	#     expect(0, x2[0].a);
	lea -56(%rbp), %rax
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
	.L35:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L35(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 82 0
	#     expect(0, x2[0].a);
	lea -56(%rbp), %rax
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
	movslq 0(%rax), %rax
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
	.L36:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L36(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	.loc 2 82 0
	#     expect(0, x2[0].a);
	lea -56(%rbp), %rax
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
	.L37:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L37(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 2 82 0
	#     expect(0, x2[0].a);
	lea -56(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $2, %rax
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
	mov $4, %rax
	push %rax
	.loc 2 82 0
	#     expect(0, x2[0].a);
	lea -56(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $2, %rax
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
	call fexpect
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 90 0
	#     expect(1, x3[0]);
	movl $1, -64(%rbp)
	movl $2, -60(%rbp)
	movl $3, -56(%rbp)
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
	mov $1, %rax
	push %rax
	.loc 2 90 0
	#     expect(1, x3[0]);
	lea -64(%rbp), %rax
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
	.L40:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L40(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	.loc 2 90 0
	#     expect(1, x3[0]);
	lea -64(%rbp), %rax
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
	.L41:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L41(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 2 90 0
	#     expect(1, x3[0]);
	lea -64(%rbp), %rax
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
test_struct_designator:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 106 0
	# }
	.loc 2 97 0
	#     expect(5, v1.x);
	movl $5, -8(%rbp)
	movl $1, -4(%rbp)
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
	mov $5, %rax
	push %rax
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
	mov $1, %rax
	push %rax
	movslq -4(%rbp), %rax
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
	.loc 2 101 0
	#     expect(7, v2.y);
	movl $0, -16(%rbp)
	movl $7, -12(%rbp)
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
	mov $7, %rax
	push %rax
	movslq -12(%rbp), %rax
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
	.loc 2 104 0
	#     expect(12, v3.y);
	movl $0, -32(%rbp)
	movl $12, -28(%rbp)
	movl $17, -24(%rbp)
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
	mov $12, %rax
	push %rax
	movslq -28(%rbp), %rax
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
	.L46:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L46(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $17, %rax
	push %rax
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
	leave
	ret
	.text
test_complex_designator:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $88, %rsp
	.loc 2 135 0
	# }
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	movl $0, -48(%rbp)
	movl $0, -44(%rbp)
	movl $0, -40(%rbp)
	movl $0, -36(%rbp)
	movl $0, -32(%rbp)
	movl $10, -28(%rbp)
	movl $11, -24(%rbp)
	movl $5, -20(%rbp)
	movl $6, -16(%rbp)
	movl $7, -12(%rbp)
	movl $8, -8(%rbp)
	movl $9, -4(%rbp)
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
	mov $0, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
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
	call fexpect
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
	mov $0, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
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
	call fexpect
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
	mov $0, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $1, %rax
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
	call fexpect
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
	.L50:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L50(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
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
	call fexpect
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
	mov $0, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $2, %rax
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
	call fexpect
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
	mov $10, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $2, %rax
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
	call fexpect
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
	.L53:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L53(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
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
	call fexpect
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
	mov $5, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
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
	call fexpect
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
	mov $6, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $1, %rax
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
	call fexpect
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
	.L56:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L56(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
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
	call fexpect
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
	.L57:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L57(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $2, %rax
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
	call fexpect
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
	.L58:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L58(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $9, %rax
	push %rax
	.loc 2 110 0
	#         [1].x[0].b = 5, 6, 7, 8, 9,
	lea -48(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
	imul $24, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
	push %rcx
	push %rax
	mov $2, %rax
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
	call fexpect
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 127 0
	#     expect(1, y2[0][0]);
	movl $0, -68(%rbp)
	movl $0, -64(%rbp)
	movl $0, -56(%rbp)
	movl $0, -52(%rbp)
	movl $1, -72(%rbp)
	movl $3, -60(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L59:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L59(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 127 0
	#     expect(1, y2[0][0]);
	lea -72(%rbp), %rax
	push %rcx
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $0, %rax
	imul $12, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	lea 0(%rax), %rax
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
	call fexpect
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
	.L60:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L60(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 2 127 0
	#     expect(1, y2[0][0]);
	lea -72(%rbp), %rax
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
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 131 0
	#     expect(1, y3.a);
	movl $0, -76(%rbp)
	movl $1, -88(%rbp)
	movl $10, -84(%rbp)
	movl $11, -80(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L61:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L61(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	movslq -88(%rbp), %rax
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
	mov $10, %rax
	push %rax
	lea -84(%rbp), %rax
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
	call fexpect
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
	mov $11, %rax
	push %rax
	lea -84(%rbp), %rax
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
	.L64:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L64(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	lea -84(%rbp), %rax
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
	call fexpect
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
test_zero:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $40, %rsp
	.loc 2 153 0
	# }
	.loc 2 140 0
	#     expect(6, v0.x);
	movl $0, -12(%rbp)
	movl $6, -16(%rbp)
	mov -16(%rbp), %rax
	mov %rax, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $6, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
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
	movslq -4(%rbp), %rax
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
	.loc 2 144 0
	#     expect(6, v1.x);
	movl $0, -20(%rbp)
	movl $6, -24(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L67:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L67(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	movslq -24(%rbp), %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L68:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L68(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	movslq -20(%rbp), %rax
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
	.loc 2 148 0
	#     expect(0, v2.x);
	movl $0, -32(%rbp)
	movl $3, -28(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L69:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L69(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	movslq -32(%rbp), %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L70:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L70(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	movslq -28(%rbp), %rax
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
	.loc 2 152 0
	#     expect(61, v3.x);
	movl $61, -40(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L71:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L71(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $61, %rax
	push %rax
	movslq -40(%rbp), %rax
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
test_typedef:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 162 0
	# }
	.loc 2 159 0
	#     A b = { 3, 4, 5 };
	movl $1, -8(%rbp)
	movl $2, -4(%rbp)
	.loc 2 160 0
	#     expect(2, sizeof(a) / sizeof(*a));
	movl $3, -24(%rbp)
	movl $4, -20(%rbp)
	movl $5, -16(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L72:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L72(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $8, %rax
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
	call fexpect
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
	.L73:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L73(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	mov $12, %rax
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
	call fexpect
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
test_excessive:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 175 0
	# 
	.loc 2 170 0
	#     expect(3, sizeof(x1));
	movb $1, -8(%rbp)
	movb $2, -7(%rbp)
	movb $3, -6(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $3, %rax
	push %rax
	mov $3, %rax
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
	.loc 2 173 0
	#     expect(3, sizeof(x2));
	movb $97, -16(%rbp)
	movb $98, -15(%rbp)
	movb $99, -14(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $3, %rax
	push %rax
	mov $3, %rax
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
	.L76:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L76(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	push %rdi
	push %rsi
	push %rdx
.data
	.L77:
	.string "abc"
.text
	lea .L77(%rip), %rax
	push %rax
	.loc 2 173 0
	#     expect(3, sizeof(x2));
	lea -16(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $3, %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	mov $0, %eax
	call strncmp
	pop %rdx
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
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 195 0
	# }
	.loc 2 183 0
	# 
	push %rdi
	sub $8, %rsp
.data
	.L78:
	.string "initializer"
.text
	lea .L78(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 2 185 0
	#     test_string();
	call test_array
	.loc 2 186 0
	#     test_struct();
	call test_string
	.loc 2 187 0
	#     test_primitive();
	call test_struct
	.loc 2 188 0
	#     test_nested();
	call test_primitive
	.loc 2 189 0
	#     test_array_designator();
	call test_nested
	.loc 2 190 0
	#     test_struct_designator();
	call test_array_designator
	.loc 2 191 0
	#     test_complex_designator();
	call test_struct_designator
	.loc 2 192 0
	#     test_zero();
	call test_complex_designator
	.loc 2 193 0
	#     test_typedef();
	call test_zero
	.loc 2 194 0
	#     test_excessive();
	call test_typedef
	.loc 2 195 0
	# }
	call test_excessive
	leave
	ret
