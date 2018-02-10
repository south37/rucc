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
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.file 2 "/home/vagrant/rucc/spec/targets/comp.c"
	.loc 2 38 0
	# }
	.loc 2 6 0
	#     expect(1, 1 < 2);
	push %rdi
.data
	.L0:
	.string "comparison operators"
.text
	lea .L0(%rip), %rax
	push %rax
	pop %rdi
	call print
	pop %rdi
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
	mov $1, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
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
	.L2:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L2(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	setl %al
	movzb %al, %eax
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
	.L3:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L3(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
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
	.L4:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L4(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	sete %al
	movzb %al, %eax
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
	.L5:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L5(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	setne %al
	movzb %al, %eax
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
	.L6:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L6(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	setne %al
	movzb %al, %eax
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
	.L7:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L7(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.L8:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L8(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.L9:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L9(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.L10:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L10(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $1, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.L11:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L11(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.L12:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L12(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $2, %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	.loc 2 22 0
	#     expect(0, i >= 0);
	mov $0, %rax
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	mov %eax, -8(%rbp)
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
	mov $0, %rax
	push %rax
	mov $0, %rax
	push %rax
	.loc 2 22 0
	#     expect(0, i >= 0);
	movslq -8(%rbp), %rax
	pop %rcx
	cmp %eax, %ecx
	setle %al
	movzb %al, %eax
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
	mov $1, %rax
	push %rax
.data
	.L15:
	.quad 4621819117588971520
.text
	movsd .L15(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L16:
	.quad 4621819117588971520
.text
	movsd .L16(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	sete %al
	movzb %al, %eax
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
	.L17:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L17(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
.data
	.L18:
	.quad 4621819117588971520
.text
	movsd .L18(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L19:
	.quad 4626322717216342016
.text
	movsd .L19(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	sete %al
	movzb %al, %eax
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
	.L20:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L20(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
.data
	.L21:
	.quad 4621819117588971520
.text
	movsd .L21(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L22:
	.quad 4621819117588971520
.text
	movsd .L22(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	setne %al
	movzb %al, %eax
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
	.L23:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L23(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
.data
	.L24:
	.quad 4621819117588971520
.text
	movsd .L24(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L25:
	.quad 4626322717216342016
.text
	movsd .L25(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	setne %al
	movzb %al, %eax
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
	.L26:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L26(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
.data
	.L27:
	.long 1092616192
.text
	movss .L27(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L28:
	.long 1092616192
.text
	movss .L28(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomiss %xmm0, %xmm1
	sete %al
	movzb %al, %eax
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
	.L29:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L29(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
.data
	.L30:
	.long 1092616192
.text
	movss .L30(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L31:
	.long 1101004800
.text
	movss .L31(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomiss %xmm0, %xmm1
	sete %al
	movzb %al, %eax
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
	.L32:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L32(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
.data
	.L33:
	.long 1092616192
.text
	movss .L33(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L34:
	.long 1092616192
.text
	movss .L34(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomiss %xmm0, %xmm1
	setne %al
	movzb %al, %eax
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
	.L35:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L35(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
.data
	.L36:
	.long 1092616192
.text
	movss .L36(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L37:
	.long 1101004800
.text
	movss .L37(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomiss %xmm0, %xmm1
	setne %al
	movzb %al, %eax
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
	.L38:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L38(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
.data
	.L39:
	.long 1092616192
.text
	movss .L39(%rip), %xmm0
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L40:
	.quad 4621819117588971520
.text
	movsd .L40(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	sete %al
	movzb %al, %eax
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
	.L41:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L41(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
.data
	.L42:
	.long 1092616192
.text
	movss .L42(%rip), %xmm0
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L43:
	.quad 4626322717216342016
.text
	movsd .L43(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	sete %al
	movzb %al, %eax
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
	.L44:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L44(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
.data
	.L45:
	.long 1092616192
.text
	movss .L45(%rip), %xmm0
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L46:
	.quad 4621819117588971520
.text
	movsd .L46(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	setne %al
	movzb %al, %eax
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
	.L47:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L47(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
.data
	.L48:
	.long 1092616192
.text
	movss .L48(%rip), %xmm0
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L49:
	.quad 4626322717216342016
.text
	movsd .L49(%rip), %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	setne %al
	movzb %al, %eax
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
