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
many_ints:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	push %r9
	mov 16(%rbp), %rax
	push %rax
	mov 24(%rbp), %rax
	push %rax
	mov 32(%rbp), %rax
	push %rax
	.file 2 "/home/vagrant/rucc/spec/targets/funcargs.c"
	.loc 2 8 0
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
	.L0:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L0(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 1 33 0
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
	mov $2, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq -16(%rbp), %rax
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
	.L2:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L2(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 1 33 0
	# }
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
	mov $4, %rax
	push %rax
	.loc 1 33 0
	# }
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
	mov $5, %rax
	push %rax
	.loc 1 33 0
	# }
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
	mov $6, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq -48(%rbp), %rax
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
	.L6:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L6(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq -56(%rbp), %rax
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
	.L7:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L7(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq -64(%rbp), %rax
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
	.L8:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L8(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $9, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq -72(%rbp), %rax
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
many_floats:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
	movsd %xmm2, (%rsp)
	sub $8, %rsp
	movsd %xmm3, (%rsp)
	sub $8, %rsp
	movsd %xmm4, (%rsp)
	sub $8, %rsp
	movsd %xmm5, (%rsp)
	sub $8, %rsp
	movsd %xmm6, (%rsp)
	sub $8, %rsp
	movsd %xmm7, (%rsp)
	mov 16(%rbp), %rax
	push %rax
	mov 24(%rbp), %rax
	push %rax
	mov 32(%rbp), %rax
	push %rax
	mov 40(%rbp), %rax
	push %rax
	mov 48(%rbp), %rax
	push %rax
	mov 56(%rbp), %rax
	push %rax
	mov 64(%rbp), %rax
	push %rax
	mov 72(%rbp), %rax
	push %rax
	mov 80(%rbp), %rax
	push %rax
	.loc 2 19 0
	# }
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L9:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L9(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -8(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L10:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L10(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
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
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L11:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L11(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -24(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L12:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L12(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -32(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L13:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L13(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -40(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L14:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L14(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -48(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L15:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L15(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -56(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L16:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L16(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -64(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L17:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L17(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $9, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -72(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L18:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L18(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -80(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L19:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L19(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -88(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L20:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L20(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -96(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L21:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L21(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $13, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -104(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L22:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L22(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $14, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -112(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L23:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L23(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $15, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -120(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
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
	mov $16, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -128(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L25:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L25(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $17, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 8 0
	# }
	movss -136(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	leave
	ret
	.text
mixed:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	push %rdi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	push %rsi
	sub $8, %rsp
	movsd %xmm2, (%rsp)
	push %rdx
	sub $8, %rsp
	movsd %xmm3, (%rsp)
	push %rcx
	sub $8, %rsp
	movsd %xmm4, (%rsp)
	push %r8
	sub $8, %rsp
	movsd %xmm5, (%rsp)
	push %r9
	sub $8, %rsp
	movsd %xmm6, (%rsp)
	mov 16(%rbp), %rax
	push %rax
	sub $8, %rsp
	movsd %xmm7, (%rsp)
	mov 24(%rbp), %rax
	push %rax
	mov 32(%rbp), %rax
	push %rax
	mov 40(%rbp), %rax
	push %rax
	mov 48(%rbp), %rax
	push %rax
	mov 56(%rbp), %rax
	push %rax
	mov 64(%rbp), %rax
	push %rax
	mov 72(%rbp), %rax
	push %rax
	mov 80(%rbp), %rax
	push %rax
	mov 88(%rbp), %rax
	push %rax
	mov 96(%rbp), %rax
	push %rax
	mov 104(%rbp), %rax
	push %rax
	mov 112(%rbp), %rax
	push %rax
	mov 120(%rbp), %rax
	push %rax
	mov 128(%rbp), %rax
	push %rax
	mov 136(%rbp), %rax
	push %rax
	mov 144(%rbp), %rax
	push %rax
	mov 152(%rbp), %rax
	push %rax
	mov 160(%rbp), %rax
	push %rax
	mov 168(%rbp), %rax
	push %rax
	mov 176(%rbp), %rax
	push %rax
	mov 184(%rbp), %rax
	push %rax
	mov 192(%rbp), %rax
	push %rax
	mov 200(%rbp), %rax
	push %rax
	mov 208(%rbp), %rax
	push %rax
	mov 216(%rbp), %rax
	push %rax
	.loc 2 36 0
	# }
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
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
	.quad 4607182418800017408
.text
	movsd .L27(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -8(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $2, %rax
	push %rax
	.loc 2 19 0
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L29:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L29(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L30:
	.quad 4613937818241073152
.text
	movsd .L30(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -24(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $4, %rax
	push %rax
	.loc 2 19 0
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
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
	.quad 4617315517961601024
.text
	movsd .L33(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -40(%rbp), %xmm0
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
	mov $6, %rax
	push %rax
	.loc 2 19 0
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L35:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L35(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L36:
	.quad 4619567317775286272
.text
	movsd .L36(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -56(%rbp), %xmm0
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
	mov $8, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -64(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
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
	.quad 4621256167635550208
.text
	movsd .L39(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -72(%rbp), %xmm0
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
	mov $10, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -80(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L41:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L41(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L42:
	.quad 4622382067542392832
.text
	movsd .L42(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -88(%rbp), %xmm0
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
	mov $12, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -96(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
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
	.quad 4623507967449235456
.text
	movsd .L45(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -104(%rbp), %xmm0
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
	mov $14, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -112(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L47:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L47(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L48:
	.quad 4624633867356078080
.text
	movsd .L48(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -120(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L49:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L49(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $16, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -128(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L50:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L50(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L51:
	.quad 4625478292286210048
.text
	movsd .L51(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -136(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L52:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L52(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $18, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -144(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L53:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L53(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L54:
	.quad 4626041242239631360
.text
	movsd .L54(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -152(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L55:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L55(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $20, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -160(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L56:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L56(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L57:
	.quad 4626604192193052672
.text
	movsd .L57(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -168(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $22, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -176(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L59:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L59(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L60:
	.quad 4627167142146473984
.text
	movsd .L60(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -184(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $24, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -192(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L62:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L62(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L63:
	.quad 4627730092099895296
.text
	movsd .L63(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -200(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L64:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L64(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $26, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -208(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L65:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L65(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L66:
	.quad 4628293042053316608
.text
	movsd .L66(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -216(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $28, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -224(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
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
	.quad 4628855992006737920
.text
	movsd .L69(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -232(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $30, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -240(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
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
	.quad 4629418941960159232
.text
	movsd .L72(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -248(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $32, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -256(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
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
	.quad 4629841154425225216
.text
	movsd .L75(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -264(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $34, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -272(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L77:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L77(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L78:
	.quad 4630122629401935872
.text
	movsd .L78(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -280(%rbp), %xmm0
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
	mov $36, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -288(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L80:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L80(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L81:
	.quad 4630404104378646528
.text
	movsd .L81(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -296(%rbp), %xmm0
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $38, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -304(%rbp), %rax
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L83:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L83(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L84:
	.quad 4630685579355357184
.text
	movsd .L84(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 19 0
	# }
	movss -312(%rbp), %xmm0
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
	mov $40, %rax
	push %rax
	.loc 2 19 0
	# }
	movslq -320(%rbp), %rax
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
	.loc 2 48 0
	#           11.0, 12, 13.0, 14, 15.0, 16, 17.0, 18, 19.0, 20,
	.loc 2 40 0
	# 
	push %rdi
	sub $8, %rsp
.data
	.L86:
	.string "function argument"
.text
	lea .L86(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 2 42 0
	# 
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	push %r9
	mov $9, %rax
	push %rax
	mov $8, %rax
	push %rax
	mov $7, %rax
	push %rax
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
	call many_ints
	add $24, %rsp
	pop %r9
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 44 0
	#                 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0,
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
	movsd %xmm2, (%rsp)
	sub $8, %rsp
	movsd %xmm3, (%rsp)
	sub $8, %rsp
	movsd %xmm4, (%rsp)
	sub $8, %rsp
	movsd %xmm5, (%rsp)
	sub $8, %rsp
	movsd %xmm6, (%rsp)
	sub $8, %rsp
	movsd %xmm7, (%rsp)
	sub $8, %rsp
.data
	.L87:
	.quad 4625478292286210048
.text
	movsd .L87(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L88:
	.quad 4625196817309499392
.text
	movsd .L88(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L89:
	.quad 4624633867356078080
.text
	movsd .L89(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L90:
	.quad 4624070917402656768
.text
	movsd .L90(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L91:
	.quad 4623507967449235456
.text
	movsd .L91(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L92:
	.quad 4622945017495814144
.text
	movsd .L92(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L93:
	.quad 4622382067542392832
.text
	movsd .L93(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L94:
	.quad 4621819117588971520
.text
	movsd .L94(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L95:
	.quad 4621256167635550208
.text
	movsd .L95(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L96:
	.quad 4607182418800017408
.text
	movsd .L96(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L97:
	.quad 4611686018427387904
.text
	movsd .L97(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L98:
	.quad 4613937818241073152
.text
	movsd .L98(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L99:
	.quad 4616189618054758400
.text
	movsd .L99(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L100:
	.quad 4617315517961601024
.text
	movsd .L100(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L101:
	.quad 4618441417868443648
.text
	movsd .L101(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L102:
	.quad 4619567317775286272
.text
	movsd .L102(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L103:
	.quad 4620693217682128896
.text
	movsd .L103(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm7
	add $8, %rsp
	movsd (%rsp), %xmm6
	add $8, %rsp
	movsd (%rsp), %xmm5
	add $8, %rsp
	movsd (%rsp), %xmm4
	add $8, %rsp
	movsd (%rsp), %xmm3
	add $8, %rsp
	movsd (%rsp), %xmm2
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	call many_floats
	add $72, %rsp
	add $8, %rsp
	movsd (%rsp), %xmm7
	add $8, %rsp
	movsd (%rsp), %xmm6
	add $8, %rsp
	movsd (%rsp), %xmm5
	add $8, %rsp
	movsd (%rsp), %xmm4
	add $8, %rsp
	movsd (%rsp), %xmm3
	add $8, %rsp
	movsd (%rsp), %xmm2
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	.loc 2 48 0
	#           11.0, 12, 13.0, 14, 15.0, 16, 17.0, 18, 19.0, 20,
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	push %r8
	push %r9
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
	movsd %xmm2, (%rsp)
	sub $8, %rsp
	movsd %xmm3, (%rsp)
	sub $8, %rsp
	movsd %xmm4, (%rsp)
	sub $8, %rsp
	movsd %xmm5, (%rsp)
	sub $8, %rsp
	movsd %xmm6, (%rsp)
	sub $8, %rsp
	movsd %xmm7, (%rsp)
	sub $8, %rsp
	mov $40, %rax
	push %rax
.data
	.L104:
	.quad 4630685579355357184
.text
	movsd .L104(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $38, %rax
	push %rax
.data
	.L105:
	.quad 4630404104378646528
.text
	movsd .L105(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $36, %rax
	push %rax
.data
	.L106:
	.quad 4630122629401935872
.text
	movsd .L106(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $34, %rax
	push %rax
.data
	.L107:
	.quad 4629841154425225216
.text
	movsd .L107(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $32, %rax
	push %rax
.data
	.L108:
	.quad 4629418941960159232
.text
	movsd .L108(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $30, %rax
	push %rax
.data
	.L109:
	.quad 4628855992006737920
.text
	movsd .L109(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $28, %rax
	push %rax
.data
	.L110:
	.quad 4628293042053316608
.text
	movsd .L110(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $26, %rax
	push %rax
.data
	.L111:
	.quad 4627730092099895296
.text
	movsd .L111(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $24, %rax
	push %rax
.data
	.L112:
	.quad 4627167142146473984
.text
	movsd .L112(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $22, %rax
	push %rax
.data
	.L113:
	.quad 4626604192193052672
.text
	movsd .L113(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $20, %rax
	push %rax
.data
	.L114:
	.quad 4626041242239631360
.text
	movsd .L114(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $18, %rax
	push %rax
.data
	.L115:
	.quad 4625478292286210048
.text
	movsd .L115(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $16, %rax
	push %rax
	mov $14, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $4, %rax
	push %rax
	mov $6, %rax
	push %rax
	mov $8, %rax
	push %rax
	mov $10, %rax
	push %rax
	mov $12, %rax
	push %rax
.data
	.L116:
	.quad 4607182418800017408
.text
	movsd .L116(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L117:
	.quad 4613937818241073152
.text
	movsd .L117(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L118:
	.quad 4617315517961601024
.text
	movsd .L118(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L119:
	.quad 4619567317775286272
.text
	movsd .L119(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L120:
	.quad 4621256167635550208
.text
	movsd .L120(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L121:
	.quad 4622382067542392832
.text
	movsd .L121(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L122:
	.quad 4623507967449235456
.text
	movsd .L122(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L123:
	.quad 4624633867356078080
.text
	movsd .L123(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm7
	add $8, %rsp
	movsd (%rsp), %xmm6
	add $8, %rsp
	movsd (%rsp), %xmm5
	add $8, %rsp
	movsd (%rsp), %xmm4
	add $8, %rsp
	movsd (%rsp), %xmm3
	add $8, %rsp
	movsd (%rsp), %xmm2
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %r9
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call mixed
	add $208, %rsp
	add $8, %rsp
	movsd (%rsp), %xmm7
	add $8, %rsp
	movsd (%rsp), %xmm6
	add $8, %rsp
	movsd (%rsp), %xmm5
	add $8, %rsp
	movsd (%rsp), %xmm4
	add $8, %rsp
	movsd (%rsp), %xmm3
	add $8, %rsp
	movsd (%rsp), %xmm2
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %r9
	pop %r8
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
