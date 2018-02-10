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
.global test_if1
test_if1:
	nop
	push %rbp
	mov %rsp, %rbp
	.file 2 "/home/vagrant/rucc/spec/targets/control.c"
	.loc 2 5 0
	# int test_if2(void) { if (0) { return 0;} return 'b'; }
	mov $1, %rax
	test %rax, %rax
	je .L88
	mov $97, %rax
	cltq
	leave
	ret
	.L88:
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if2
test_if2:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 6 0
	# int test_if3(void) { if (1) { return 'c';} else { return 0; } return 0; }
	mov $0, %rax
	test %rax, %rax
	je .L89
	mov $0, %rax
	cltq
	leave
	ret
	.L89:
	mov $98, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if3
test_if3:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 7 0
	# int test_if4(void) { if (0) { return 0;} else { return 'd'; } return 0; }
	mov $1, %rax
	test %rax, %rax
	je .L90
	mov $99, %rax
	cltq
	leave
	ret
	jmp .L91
	.L90:
	mov $0, %rax
	cltq
	leave
	ret
	.L91:
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if4
test_if4:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 8 0
	# int test_if5(void) { if (1) return 'e'; return 0; }
	mov $0, %rax
	test %rax, %rax
	je .L92
	mov $0, %rax
	cltq
	leave
	ret
	jmp .L93
	.L92:
	mov $100, %rax
	cltq
	leave
	ret
	.L93:
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if5
test_if5:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 9 0
	# int test_if6(void) { if (0) return 0; return 'f'; }
	mov $1, %rax
	test %rax, %rax
	je .L94
	mov $101, %rax
	cltq
	leave
	ret
	.L94:
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if6
test_if6:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 10 0
	# int test_if7(void) { if (1) return 'g'; else return 0; return 0; }
	mov $0, %rax
	test %rax, %rax
	je .L95
	mov $0, %rax
	cltq
	leave
	ret
	.L95:
	mov $102, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if7
test_if7:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 11 0
	# int test_if8(void) { if (0) return 0; else return 'h'; return 0; }
	mov $1, %rax
	test %rax, %rax
	je .L96
	mov $103, %rax
	cltq
	leave
	ret
	jmp .L97
	.L96:
	mov $0, %rax
	cltq
	leave
	ret
	.L97:
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if8
test_if8:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 12 0
	# int test_if9(void) { if (0+1) return 'i'; return 0; }
	mov $0, %rax
	test %rax, %rax
	je .L98
	mov $0, %rax
	cltq
	leave
	ret
	jmp .L99
	.L98:
	mov $104, %rax
	cltq
	leave
	ret
	.L99:
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if9
test_if9:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 13 0
	# int test_if10(void) { if (1-1) return 0; return 'j'; }
	mov $0, %rax
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	test %rax, %rax
	je .L100
	mov $105, %rax
	cltq
	leave
	ret
	.L100:
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if10
test_if10:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 14 0
	# int test_if11(void) { if (0.5) return 'k'; return 0; }
	mov $1, %rax
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	test %rax, %rax
	je .L101
	mov $0, %rax
	cltq
	leave
	ret
	.L101:
	mov $106, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global test_if11
test_if11:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 15 0
	# 
.data
	.L102:
	.quad 4602678819172646912
.text
	movsd .L102(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	xorpd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	setne %al
	movsd (%rsp), %xmm1
	add $8, %rsp
	movzb %al, %eax
	test %rax, %rax
	je .L103
	mov $107, %rax
	cltq
	leave
	ret
	.L103:
	mov $0, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
test_if:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 28 0
	# }
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L104:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L104(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $97, %rax
	push %rax
	sub $8, %rsp
	call test_if1@PLT
	add $8, %rsp
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
	.L105:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L105(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $98, %rax
	push %rax
	sub $8, %rsp
	call test_if2@PLT
	add $8, %rsp
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
	.L106:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L106(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $99, %rax
	push %rax
	sub $8, %rsp
	call test_if3@PLT
	add $8, %rsp
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
	.L107:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L107(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $100, %rax
	push %rax
	sub $8, %rsp
	call test_if4@PLT
	add $8, %rsp
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
	.L108:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L108(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $101, %rax
	push %rax
	sub $8, %rsp
	call test_if5@PLT
	add $8, %rsp
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
	.L109:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L109(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $102, %rax
	push %rax
	sub $8, %rsp
	call test_if6@PLT
	add $8, %rsp
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
	.L110:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L110(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $103, %rax
	push %rax
	sub $8, %rsp
	call test_if7@PLT
	add $8, %rsp
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
	.L111:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L111(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $104, %rax
	push %rax
	sub $8, %rsp
	call test_if8@PLT
	add $8, %rsp
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
	.L112:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L112(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $105, %rax
	push %rax
	sub $8, %rsp
	call test_if9@PLT
	add $8, %rsp
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
	.L113:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L113(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $106, %rax
	push %rax
	sub $8, %rsp
	call test_if10@PLT
	add $8, %rsp
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
	.L114:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L114(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $107, %rax
	push %rax
	sub $8, %rsp
	call test_if11@PLT
	add $8, %rsp
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
test_for:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $40, %rsp
	.loc 2 66 0
	# }
	.loc 2 32 0
	#     int acc = 0;
	.loc 2 33 0
	#     for (i = 0; i < 5; i++) {
	movl $0, -16(%rbp)
	.loc 2 35 0
	#     }
	.loc 2 34 0
	#         acc = acc + i;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 35 0
	#     }
	.L0:
	.loc 2 34 0
	#         acc = acc + i;
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 34 0
	#         acc = acc + i;
	mov $5, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L115
	jmp .L116
	.L115:
	.loc 2 35 0
	#     }
	jmp .L2
	.L116:
	.loc 2 33 0
	#     for (i = 0; i < 5; i++) {
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 35 0
	#     }
	.L1:
	.loc 2 34 0
	#         acc = acc + i;
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 35 0
	#     }
	jmp .L0
	.L2:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L117:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L117(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	.loc 2 33 0
	#     for (i = 0; i < 5; i++) {
	movslq -16(%rbp), %rax
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
	.loc 2 39 0
	#     for (i = 0; i < 5; i++) {
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 41 0
	#     }
	.loc 2 40 0
	#         acc = acc + i;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 41 0
	#     }
	.L3:
	.loc 2 40 0
	#         acc = acc + i;
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 40 0
	#         acc = acc + i;
	mov $5, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L118
	jmp .L119
	.L118:
	.loc 2 41 0
	#     }
	jmp .L5
	.L119:
	.loc 2 33 0
	#     for (i = 0; i < 5; i++) {
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 41 0
	#     }
	.L4:
	.loc 2 40 0
	#         acc = acc + i;
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 41 0
	#     }
	jmp .L3
	.L5:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L120:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L120(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	.loc 2 33 0
	#     for (i = 0; i < 5; i++) {
	movslq -16(%rbp), %rax
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
	#     for (i = 0; i < 100; i++) {
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 49 0
	#     }
	.loc 2 46 0
	#         if (i < 5) continue;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 49 0
	#     }
	.L6:
	.loc 2 46 0
	#         if (i < 5) continue;
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 46 0
	#         if (i < 5) continue;
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L121
	jmp .L122
	.L121:
	.loc 2 49 0
	#     }
	jmp .L8
	.L122:
	.loc 2 47 0
	#         if (i == 9) break;
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 47 0
	#         if (i == 9) break;
	mov $5, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L123
	jmp .L7
	.L123:
	.loc 2 48 0
	#         acc += i;
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 48 0
	#         acc += i;
	mov $9, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L124
	jmp .L8
	.L124:
	.loc 2 49 0
	#     }
	.loc 2 33 0
	#     for (i = 0; i < 5; i++) {
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 49 0
	#     }
	.L7:
	.loc 2 46 0
	#         if (i < 5) continue;
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 49 0
	#     }
	jmp .L6
	.L8:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L125:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L125(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
	mov $6, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $7, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	.loc 2 33 0
	#     for (i = 0; i < 5; i++) {
	movslq -16(%rbp), %rax
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
	.loc 2 53 0
	#         expect(z, x + y);
	movl $3, -24(%rbp)
	movl $5, -32(%rbp)
	movl $8, -40(%rbp)
	.L9:
	movslq -24(%rbp), %rax
	push %rax
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L126
	jmp .L127
	.L126:
	jmp .L11
	.L127:
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L128:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L128(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	movslq -40(%rbp), %rax
	push %rax
	movslq -24(%rbp), %rax
	push %rax
	movslq -32(%rbp), %rax
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
	.L10:
	movslq -24(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -24(%rbp)
	pop %rax
	movslq -32(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -32(%rbp)
	pop %rax
	movslq -40(%rbp), %rax
	push %rax
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -40(%rbp)
	jmp .L9
	.L11:
	.loc 2 56 0
	#         break;
	.L12:
	jmp .L14
	.L13:
	jmp .L12
	.L14:
	.loc 2 58 0
	#         ;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.L15:
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 58 0
	#         ;
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L129
	jmp .L130
	.L129:
	jmp .L17
	.L130:
	.L16:
	.loc 2 32 0
	#     int acc = 0;
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 58 0
	#         ;
	jmp .L15
	.L17:
	.loc 2 61 0
	#     for (; 0.5;) {
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 64 0
	#     }
	.L18:
	.loc 2 62 0
	#         i = 68;
.data
	.L131:
	.quad 4602678819172646912
.text
	movsd .L131(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	xorpd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	setne %al
	movsd (%rsp), %xmm1
	add $8, %rsp
	movzb %al, %eax
	test %rax, %rax
	je .L132
	jmp .L133
	.L132:
	.loc 2 64 0
	#     }
	jmp .L20
	.L133:
	.loc 2 63 0
	#         break;
	mov $68, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 64 0
	#     }
	jmp .L20
	.L19:
	jmp .L18
	.L20:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L134:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L134(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $68, %rax
	push %rax
	.loc 2 32 0
	#     int acc = 0;
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
test_while:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 101 0
	# }
	.loc 2 70 0
	#     int i = 0;
	movl $0, -8(%rbp)
	.loc 2 71 0
	#     while (i <= 100)
	movl $0, -16(%rbp)
	.loc 2 72 0
	#         acc = acc + i++;
	.L21:
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 72 0
	#         acc = acc + i++;
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
	test %rax, %rax
	je .L135
	.loc 2 70 0
	#     int i = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 72 0
	#         acc = acc + i++;
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
	jmp .L136
	.L135:
	.loc 2 72 0
	#         acc = acc + i++;
	jmp .L22
	.L136:
	jmp .L21
	.L22:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L137:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L137(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5050, %rax
	push %rax
	.loc 2 70 0
	#     int i = 0;
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
	.loc 2 76 0
	#     i = 0;
	mov $1, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 77 0
	#     while (i <= 100) {
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 79 0
	#     }
	.L23:
	.loc 2 78 0
	#         acc = acc + i++;
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 78 0
	#         acc = acc + i++;
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
	test %rax, %rax
	je .L138
	.loc 2 79 0
	#     }
	.loc 2 70 0
	#     int i = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 79 0
	#     }
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
	jmp .L139
	.L138:
	.loc 2 79 0
	#     }
	jmp .L24
	.L139:
	jmp .L23
	.L24:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L140:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L140(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5051, %rax
	push %rax
	.loc 2 70 0
	#     int i = 0;
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
	.loc 2 83 0
	#     i = 0;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 84 0
	#     while (i < 10) {
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 88 0
	#     }
	.L25:
	.loc 2 85 0
	#         if (i++ < 5) continue;
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 85 0
	#         if (i++ < 5) continue;
	mov $10, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L141
	.loc 2 88 0
	#     }
	.loc 2 86 0
	#         acc += i;
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	push %rax
	.loc 2 86 0
	#         acc += i;
	mov $5, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L142
	jmp .L25
	.L142:
	.loc 2 87 0
	#         if (i == 9) break;
	.loc 2 70 0
	#     int i = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 88 0
	#     }
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 88 0
	#     }
	mov $9, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L143
	jmp .L26
	.L143:
	jmp .L144
	.L141:
	jmp .L26
	.L144:
	jmp .L25
	.L26:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L145:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L145(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	mov $7, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $9, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	.loc 2 70 0
	#     int i = 0;
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
	.loc 2 92 0
	#     while (i++ < 100)
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 93 0
	#         ;
	.L27:
	.loc 2 71 0
	#     while (i <= 100)
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	push %rax
	.loc 2 93 0
	#         ;
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L146
	jmp .L147
	.L146:
	jmp .L28
	.L147:
	jmp .L27
	.L28:
	.loc 2 96 0
	#     while (0.5) {
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 99 0
	#     }
	.L29:
	.loc 2 97 0
	#         i = 67;
.data
	.L148:
	.quad 4602678819172646912
.text
	movsd .L148(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	xorpd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	setne %al
	movsd (%rsp), %xmm1
	add $8, %rsp
	movzb %al, %eax
	test %rax, %rax
	je .L149
	.loc 2 99 0
	#     }
	.loc 2 98 0
	#         break;
	mov $67, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 99 0
	#     }
	jmp .L30
	jmp .L150
	.L149:
	jmp .L30
	.L150:
	jmp .L29
	.L30:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L151:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L151(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $67, %rax
	push %rax
	.loc 2 71 0
	#     while (i <= 100)
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
	.text
test_do:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 134 0
	# }
	.loc 2 105 0
	#     int i = 0;
	movl $0, -8(%rbp)
	.loc 2 106 0
	#     do {
	movl $0, -16(%rbp)
	.loc 2 108 0
	#     } while (i <= 100);
	.L31:
	.loc 2 105 0
	#     int i = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 108 0
	#     } while (i <= 100);
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 108 0
	#     } while (i <= 100);
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 108 0
	#     } while (i <= 100);
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
	test %rax, %rax
	je .L152
	jmp .L31
	.L152:
	.L32:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L153:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L153(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5050, %rax
	push %rax
	.loc 2 105 0
	#     int i = 0;
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
	.loc 2 112 0
	#     do { i = 37; } while (0);
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 113 0
	#     expect(37, i);
	.L33:
	mov $37, %rax
	cltq
	mov %eax, -16(%rbp)
	mov $0, %rax
	test %rax, %rax
	je .L154
	jmp .L33
	.L154:
	.L34:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L155:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L155(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $37, %rax
	push %rax
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
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
	.loc 2 116 0
	#     i = 0;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 117 0
	#     do {
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 121 0
	#     } while (i < 10);
	.L35:
	.loc 2 119 0
	#         acc += i;
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	push %rax
	.loc 2 119 0
	#         acc += i;
	mov $5, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L156
	jmp .L35
	.L156:
	.loc 2 120 0
	#         if (i == 9) break;
	.loc 2 105 0
	#     int i = 0;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 121 0
	#     } while (i < 10);
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 121 0
	#     } while (i < 10);
	mov $9, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L157
	jmp .L36
	.L157:
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	push %rax
	.loc 2 121 0
	#     } while (i < 10);
	mov $10, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L158
	jmp .L35
	.L158:
	.L36:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L159:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L159(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	mov $7, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $9, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	.loc 2 105 0
	#     int i = 0;
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
	.loc 2 125 0
	#     do {} while (i++ < 100);
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 126 0
	# 
	.L37:
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	push %rax
	.loc 2 126 0
	# 
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L160
	jmp .L37
	.L160:
	.L38:
	.loc 2 128 0
	#     do; while (i++ < 100);
	mov $0, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 129 0
	# 
	.L39:
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	push %rax
	.loc 2 129 0
	# 
	mov $100, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L161
	jmp .L39
	.L161:
	.L40:
	.loc 2 131 0
	#     i = 70;
	mov $1, %rax
	cvtsi2ss %eax, %xmm0
	movss %xmm0, -24(%rbp)
	.loc 2 132 0
	#     do i++; while (v -= 0.5);
	mov $70, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 133 0
	#     expect(72, i);
	.L41:
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	.loc 2 133 0
	#     expect(72, i);
	.loc 2 131 0
	#     i = 70;
	movss -24(%rbp), %xmm0
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 133 0
	#     expect(72, i);
.data
	.L162:
	.quad 4602678819172646912
.text
	movsd .L162(%rip), %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	subsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
	movss %xmm0, -24(%rbp)
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	xorpd %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	setne %al
	movsd (%rsp), %xmm1
	add $8, %rsp
	movzb %al, %eax
	test %rax, %rax
	je .L163
	jmp .L41
	.L163:
	.L42:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L164:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L164(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $72, %rax
	push %rax
	.loc 2 106 0
	#     do {
	movslq -16(%rbp), %rax
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
test_switch:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $80, %rsp
	.loc 2 196 0
	#         ;
	.loc 2 138 0
	#     switch (1+2) {
	movl $0, -8(%rbp)
	.loc 2 142 0
	#     }
	.loc 2 139 0
	#     case 0: fail("0");
	mov $1, %rax
	push %rax
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -16(%rbp)
	.loc 2 142 0
	#     }
	movslq -16(%rbp), %rax
	push %rax
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L165
	jmp .L44
	.L165:
	movslq -16(%rbp), %rax
	push %rax
	mov $3, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L166
	jmp .L45
	.L166:
	movslq -16(%rbp), %rax
	push %rax
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L167
	jmp .L46
	.L167:
	jmp .L43
	.loc 2 140 0
	#     case 3: a = 3; break;
	.L44:
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
.data
	.L168:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L168(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L169:
	.string "0"
.text
	lea .L169(%rip), %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call ffail@PLT
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 141 0
	#     case 1: fail("1");
	.L45:
	mov $3, %rax
	cltq
	mov %eax, -8(%rbp)
	jmp .L43
	.loc 2 142 0
	#     }
	.L46:
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
.data
	.L170:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L170(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L171:
	.string "1"
.text
	lea .L171(%rip), %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call ffail@PLT
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.L43:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L172:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L172(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $3, %rax
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
	.loc 2 146 0
	#     switch (1) {
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 151 0
	#     }
	.loc 2 147 0
	#     case 0: a++;
	mov $1, %rax
	cltq
	mov %eax, -24(%rbp)
	.loc 2 151 0
	#     }
	movslq -24(%rbp), %rax
	push %rax
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L173
	jmp .L48
	.L173:
	movslq -24(%rbp), %rax
	push %rax
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L174
	jmp .L49
	.L174:
	movslq -24(%rbp), %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L175
	jmp .L50
	.L175:
	movslq -24(%rbp), %rax
	push %rax
	mov $3, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L176
	jmp .L51
	.L176:
	jmp .L47
	.loc 2 148 0
	#     case 1: a++;
	.L48:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 149 0
	#     case 2: a++;
	.L49:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 150 0
	#     case 3: a++;
	.L50:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 151 0
	#     }
	.L51:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 151 0
	#     }
	.L47:
	.loc 2 153 0
	# 
	mov $3, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 155 0
	#     switch (100) {
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 158 0
	#     }
	.loc 2 156 0
	#     case 0: a++;
	mov $100, %rax
	cltq
	mov %eax, -32(%rbp)
	.loc 2 158 0
	#     }
	movslq -32(%rbp), %rax
	push %rax
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L177
	jmp .L53
	.L177:
	jmp .L54
	.loc 2 157 0
	#     default: a = 55;
	.L53:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 158 0
	#     }
	.L54:
	mov $55, %rax
	cltq
	mov %eax, -8(%rbp)
	.L52:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L178:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L178(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $55, %rax
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
	.loc 2 162 0
	#     switch (100) {
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 164 0
	#     }
	.loc 2 163 0
	#     case 0: a++;
	mov $100, %rax
	cltq
	mov %eax, -40(%rbp)
	.loc 2 164 0
	#     }
	movslq -40(%rbp), %rax
	push %rax
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L179
	jmp .L56
	.L179:
	jmp .L55
	.L56:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 164 0
	#     }
	.L55:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L180:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L180(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	.loc 2 168 0
	#     switch (3) {
	mov $5, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 170 0
	#     }
	.loc 2 169 0
	#         a++;
	mov $3, %rax
	cltq
	mov %eax, -48(%rbp)
	.loc 2 170 0
	#     }
	jmp .L57
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 170 0
	#     }
	.L57:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L181:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L181(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $5, %rax
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
	.loc 2 178 0
	#     }
	.loc 2 174 0
	#     case 1 ... 2: fail("switch");
	mov $7, %rax
	cltq
	mov %eax, -56(%rbp)
	.loc 2 178 0
	#     }
	mov $1, %rax
	push %rax
	movslq -56(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
	test %rax, %rax
	mov $0, %rax
	je .L182
	movslq -56(%rbp), %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
	test %rax, %rax
	mov $0, %rax
	je .L182
	mov $1, %rax
	.L182:
	test %rax, %rax
	je .L183
	jmp .L59
	.L183:
	movslq -56(%rbp), %rax
	push %rax
	mov $3, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L184
	jmp .L60
	.L184:
	mov $5, %rax
	push %rax
	movslq -56(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
	test %rax, %rax
	mov $0, %rax
	je .L185
	movslq -56(%rbp), %rax
	push %rax
	mov $10, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
	test %rax, %rax
	mov $0, %rax
	je .L185
	mov $1, %rax
	.L185:
	test %rax, %rax
	je .L186
	jmp .L61
	.L186:
	jmp .L62
	.loc 2 175 0
	#     case 3: fail("switch");
	.L59:
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
.data
	.L187:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L187(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L188:
	.string "switch"
.text
	lea .L188(%rip), %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call ffail@PLT
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 176 0
	#     case 5 ... 10: break;
	.L60:
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
.data
	.L189:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L189(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L190:
	.string "switch"
.text
	lea .L190(%rip), %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call ffail@PLT
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 177 0
	#     default: fail("switch");
	.L61:
	jmp .L58
	.loc 2 178 0
	#     }
	.L62:
	push %rdi
	push %rsi
	push %rdx
	sub $8, %rsp
.data
	.L191:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L191(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L192:
	.string "switch"
.text
	lea .L192(%rip), %rax
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call ffail@PLT
	add $8, %rsp
	pop %rdx
	pop %rsi
	pop %rdi
	.L58:
	.loc 2 181 0
	#     int count = 27;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 182 0
	#     switch (count % 8) {
	movl $27, -64(%rbp)
	.loc 2 191 0
	#             } while ((count -= 8) > 0);
	.loc 2 183 0
	#     case 0: do {  a++;
	.loc 2 182 0
	#     switch (count % 8) {
	movslq -64(%rbp), %rax
	push %rax
	.loc 2 183 0
	#     case 0: do {  a++;
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	cqto
	idiv %rcx
	mov %edx, %eax
	cltq
	mov %eax, -72(%rbp)
	.loc 2 191 0
	#             } while ((count -= 8) > 0);
	movslq -72(%rbp), %rax
	push %rax
	mov $0, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L193
	jmp .L64
	.L193:
	movslq -72(%rbp), %rax
	push %rax
	mov $7, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L194
	jmp .L67
	.L194:
	movslq -72(%rbp), %rax
	push %rax
	mov $6, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L195
	jmp .L68
	.L195:
	movslq -72(%rbp), %rax
	push %rax
	mov $5, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L196
	jmp .L69
	.L196:
	movslq -72(%rbp), %rax
	push %rax
	mov $4, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L197
	jmp .L70
	.L197:
	movslq -72(%rbp), %rax
	push %rax
	mov $3, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L198
	jmp .L71
	.L198:
	movslq -72(%rbp), %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L199
	jmp .L72
	.L199:
	movslq -72(%rbp), %rax
	push %rax
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L200
	jmp .L73
	.L200:
	jmp .L63
	.loc 2 184 0
	#     case 7:       a++;
	.L64:
	.loc 2 191 0
	#             } while ((count -= 8) > 0);
	.L65:
	.loc 2 184 0
	#     case 7:       a++;
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 185 0
	#     case 6:       a++;
	.L67:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 186 0
	#     case 5:       a++;
	.L68:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 187 0
	#     case 4:       a++;
	.L69:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 188 0
	#     case 3:       a++;
	.L70:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 189 0
	#     case 2:       a++;
	.L71:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 190 0
	#     case 1:       a++;
	.L72:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 191 0
	#             } while ((count -= 8) > 0);
	.L73:
	.loc 2 138 0
	#     switch (1+2) {
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.loc 2 191 0
	#             } while ((count -= 8) > 0);
	mov $0, %rax
	push %rax
	.loc 2 182 0
	#     switch (count % 8) {
	movslq -64(%rbp), %rax
	push %rax
	.loc 2 191 0
	#             } while ((count -= 8) > 0);
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	cltq
	mov %eax, -64(%rbp)
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L201
	jmp .L65
	.L201:
	.L66:
	.L63:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L202:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L202(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $27, %rax
	push %rax
	.loc 2 138 0
	#     switch (1+2) {
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
	.loc 2 196 0
	#         ;
	mov $1, %rax
	cltq
	mov %eax, -80(%rbp)
	jmp .L74
	.L74:
	leave
	ret
	.text
test_goto:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 215 0
	#     ;
	.loc 2 201 0
	#     goto x;
	movl $0, -8(%rbp)
	.loc 2 202 0
	#     acc = 5;
	jmp .L75
	.loc 2 203 0
	#  x: expect(0, acc);
	mov $5, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 204 0
	# 
	.L75:
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L203:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L203(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 201 0
	#     goto x;
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
	.loc 2 206 0
	#     acc = 0;
	movl $0, -16(%rbp)
	.loc 2 207 0
	#  y: if (i > 10) goto z;
	mov $0, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 208 0
	#     acc += i++;
	.L77:
	mov $10, %rax
	push %rax
	.loc 2 206 0
	#     acc = 0;
	movslq -16(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L204
	.loc 2 208 0
	#     acc += i++;
	jmp .L76
	.L204:
	.loc 2 209 0
	#     goto y;
	.loc 2 201 0
	#     goto x;
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 209 0
	#     goto y;
	.loc 2 206 0
	#     acc = 0;
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 2 210 0
	#  z: if (i > 11) goto a;
	jmp .L77
	.loc 2 211 0
	#     expect(55, acc);
	.L76:
	mov $11, %rax
	push %rax
	.loc 2 206 0
	#     acc = 0;
	movslq -16(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L205
	.loc 2 211 0
	#     expect(55, acc);
	jmp .L78
	.L205:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L206:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L206(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $55, %rax
	push %rax
	.loc 2 201 0
	#     goto x;
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
	.loc 2 213 0
	#     goto y;
	.loc 2 206 0
	#     acc = 0;
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	.loc 2 214 0
	#  a:
	jmp .L77
	.loc 2 215 0
	#     ;
	.L78:
	leave
	ret
	.text
test_label:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 2 239 0
	# }
	.loc 2 220 0
	#     if (1)
	movl $0, -8(%rbp)
	.loc 2 221 0
	#       L1: x++;
	mov $1, %rax
	test %rax, %rax
	je .L207
	.loc 2 220 0
	#     if (1)
	movslq -8(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -8(%rbp)
	pop %rax
	.L207:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L208:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L208(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 2 220 0
	#     if (1)
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
	.loc 2 225 0
	#     if (0)
	movl $0, -16(%rbp)
	.loc 2 226 0
	#       L2: y++;
	mov $0, %rax
	test %rax, %rax
	je .L209
	.loc 2 225 0
	#     if (0)
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	.L209:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L210:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L210(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 225 0
	#     if (0)
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
	.loc 2 230 0
	#     switch (7) {
	movl $0, -24(%rbp)
	.loc 2 236 0
	#           case 6: z += 5;
	.loc 2 231 0
	#         if (1)
	mov $7, %rax
	cltq
	mov %eax, -32(%rbp)
	.loc 2 236 0
	#           case 6: z += 5;
	movslq -32(%rbp), %rax
	push %rax
	mov $5, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L211
	jmp .L80
	.L211:
	movslq -32(%rbp), %rax
	push %rax
	mov $7, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L212
	jmp .L81
	.L212:
	movslq -32(%rbp), %rax
	push %rax
	mov $6, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
	test %rax, %rax
	je .L213
	jmp .L82
	.L213:
	jmp .L79
	.loc 2 232 0
	#           case 5: z += 2;
	mov $1, %rax
	test %rax, %rax
	je .L214
	.L80:
	.loc 2 230 0
	#     switch (7) {
	movslq -24(%rbp), %rax
	push %rax
	.loc 2 232 0
	#           case 5: z += 2;
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -24(%rbp)
	.L214:
	.loc 2 234 0
	#           case 7: z += 3;
	mov $0, %rax
	test %rax, %rax
	je .L215
	.L81:
	.loc 2 230 0
	#     switch (7) {
	movslq -24(%rbp), %rax
	push %rax
	.loc 2 234 0
	#           case 7: z += 3;
	mov $3, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -24(%rbp)
	.L215:
	.loc 2 236 0
	#           case 6: z += 5;
	mov $1, %rax
	test %rax, %rax
	je .L216
	.L82:
	.loc 2 230 0
	#     switch (7) {
	movslq -24(%rbp), %rax
	push %rax
	.loc 2 236 0
	#           case 6: z += 5;
	mov $5, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -24(%rbp)
	.L216:
	.L79:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L217:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L217(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	push %rax
	.loc 2 230 0
	#     switch (7) {
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
	leave
	ret
	.data 0
.S0.p:
	.quad .L87
	.text
test_computed_goto:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $48, %rsp
	.loc 2 262 0
	#     ;
	.loc 2 243 0
	#     int acc = 0;
	mov $.L83, %rax
	mov %rax, -32(%rbp)
	mov $.L84, %rax
	mov %rax, -24(%rbp)
	mov $.L85, %rax
	mov %rax, -16(%rbp)
	mov $.L86, %rax
	mov %rax, -8(%rbp)
	.loc 2 244 0
	#     goto *t.x;
	movl $0, -40(%rbp)
	.loc 2 245 0
	#     acc = 5;
	mov -32(%rbp), %rax
	jmp *%rax
	.loc 2 246 0
	#  x: expect(0, acc);
	mov $5, %rax
	cltq
	mov %eax, -40(%rbp)
	.loc 2 247 0
	# 
	.L83:
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L218:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L218(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 244 0
	#     goto *t.x;
	movslq -40(%rbp), %rax
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
	.loc 2 249 0
	#     acc = 0;
	movl $0, -48(%rbp)
	.loc 2 250 0
	#  y: if (i > 10) goto *t.z;
	mov $0, %rax
	cltq
	mov %eax, -40(%rbp)
	.loc 2 251 0
	#     acc += i++;
	.L84:
	mov $10, %rax
	push %rax
	.loc 2 249 0
	#     acc = 0;
	movslq -48(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L219
	.loc 2 251 0
	#     acc += i++;
	mov -16(%rbp), %rax
	jmp *%rax
	.L219:
	.loc 2 252 0
	#     goto *t.y;
	.loc 2 244 0
	#     goto *t.x;
	movslq -40(%rbp), %rax
	push %rax
	.loc 2 252 0
	#     goto *t.y;
	.loc 2 249 0
	#     acc = 0;
	movslq -48(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -48(%rbp)
	pop %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	mov %eax, -40(%rbp)
	.loc 2 253 0
	#  z: if (i > 11) goto *t.a;
	mov -24(%rbp), %rax
	jmp *%rax
	.loc 2 254 0
	#     expect(55, acc);
	.L85:
	mov $11, %rax
	push %rax
	.loc 2 249 0
	#     acc = 0;
	movslq -48(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
	test %rax, %rax
	je .L220
	.loc 2 254 0
	#     expect(55, acc);
	mov -8(%rbp), %rax
	jmp *%rax
	.L220:
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L221:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L221(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $55, %rax
	push %rax
	.loc 2 244 0
	#     goto *t.x;
	movslq -40(%rbp), %rax
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
	.loc 2 256 0
	#     goto *t.y;
	.loc 2 249 0
	#     acc = 0;
	movslq -48(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -48(%rbp)
	pop %rax
	.loc 2 257 0
	#  a:
	mov -24(%rbp), %rax
	jmp *%rax
	.loc 2 258 0
	#     ;
	.L86:
	.loc 2 261 0
	#  L:
	.loc 2 260 0
	#     goto *p;
	mov .S0.p+0(%rip), %rax
	jmp *%rax
	.loc 2 262 0
	#     ;
	.L87:
	leave
	ret
	.text
test_logor:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 269 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L222:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L222(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $0, %rax
	test %rax, %rax
	mov $1, %rax
	jne .L223
	mov $3, %rax
	test %rax, %rax
	mov $1, %rax
	jne .L223
	mov $0, %rax
	.L223:
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
	.L224:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L224(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $5, %rax
	test %rax, %rax
	mov $1, %rax
	jne .L225
	mov $0, %rax
	test %rax, %rax
	mov $1, %rax
	jne .L225
	mov $0, %rax
	.L225:
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
	.L226:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L226(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $0, %rax
	test %rax, %rax
	mov $1, %rax
	jne .L227
	mov $0, %rax
	test %rax, %rax
	mov $1, %rax
	jne .L227
	mov $0, %rax
	.L227:
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
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 282 0
	# }
	.loc 2 273 0
	#     test_if();
	push %rdi
	sub $8, %rsp
.data
	.L228:
	.string "control flow"
.text
	lea .L228(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 274 0
	#     test_for();
	call test_if@PLT
	.loc 2 275 0
	#     test_while();
	call test_for@PLT
	.loc 2 276 0
	#     test_do();
	call test_while@PLT
	.loc 2 277 0
	#     test_switch();
	call test_do@PLT
	.loc 2 278 0
	#     test_goto();
	call test_switch@PLT
	.loc 2 279 0
	#     test_label();
	call test_goto@PLT
	.loc 2 280 0
	#     test_computed_goto();
	call test_label@PLT
	.loc 2 281 0
	#     test_logor();
	call test_computed_goto@PLT
	.loc 2 282 0
	# }
	call test_logor@PLT
	leave
	ret
