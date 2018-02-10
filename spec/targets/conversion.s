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
test_bool:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.file 2 "/home/vagrant/rucc/spec/targets/conversion.c"
	.loc 2 13 0
	# }
	.loc 2 6 0
	#     expect(1, v);
	mov $3, %rax
	cmp $0, %rax
	setne %al
	movzb %al, %eax
	test %rax, %rax
	setne %al
	mov %al, -8(%rbp)
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
	mov $1, %rax
	push %rax
	.loc 2 6 0
	#     expect(1, v);
	movsbq -8(%rbp), %rax
	movsbq %al, %rax
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
	.loc 2 8 0
	#     expect(1, v);
	mov $5, %rax
	cmp $0, %rax
	setne %al
	movzb %al, %eax
	cmp $0, %rax
	setne %al
	movzb %al, %eax
	test %rax, %rax
	setne %al
	mov %al, -8(%rbp)
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
	.loc 2 6 0
	#     expect(1, v);
	movsbq -8(%rbp), %rax
	movsbq %al, %rax
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
	.loc 2 10 0
	#     expect(1, v);
.data
	.L2:
	.quad 4602678819172646912
.text
	movsd .L2(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	xorpd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	setne %al
	movsd (%rsp), %xmm1
	add $8, %rsp
	movzb %al, %eax
	cmp $0, %rax
	setne %al
	movzb %al, %eax
	test %rax, %rax
	setne %al
	mov %al, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	.loc 2 6 0
	#     expect(1, v);
	movsbq -8(%rbp), %rax
	movsbq %al, %rax
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
	.loc 2 12 0
	#     expect(0, v);
.data
	.L4:
	.quad 0
.text
	movsd .L4(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	xorpd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	setne %al
	movsd (%rsp), %xmm1
	add $8, %rsp
	movzb %al, %eax
	cmp $0, %rax
	setne %al
	movzb %al, %eax
	test %rax, %rax
	setne %al
	mov %al, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	.loc 2 6 0
	#     expect(1, v);
	movsbq -8(%rbp), %rax
	movsbq %al, %rax
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
test_float:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 2 19 0
	# }
	.loc 2 17 0
	#     float b = a;
	movl $0, -8(%rbp)
	movl $1074790400, -4(%rbp)
	.loc 2 18 0
	#     expectf(4, b);
	.loc 2 17 0
	#     float b = a;
	movsd -8(%rbp), %xmm0
	cvtpd2ps %xmm0, %xmm0
	movss %xmm0, -16(%rbp)
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L6:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L6(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 18 0
	#     expectf(4, b);
	movss -16(%rbp), %xmm0
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
	leave
	ret
	.text
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 25 0
	# }
	.loc 2 23 0
	#     test_bool();
	push %rdi
	sub $8, %rsp
.data
	.L7:
	.string "type conversion"
.text
	lea .L7(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 2 24 0
	#     test_float();
	call test_bool
	.loc 2 25 0
	# }
	call test_float
	leave
	ret
