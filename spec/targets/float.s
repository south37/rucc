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
.global tf1
tf1:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.file 2 "/home/vagrant/rucc/spec/targets/float.c"
	.loc 2 8 0
	# float tf2(double a) { return a; }
	.loc 1 33 0
	# }
	movss -8(%rbp), %xmm0
	leave
	ret
	leave
	ret
	.text
.global tf2
tf2:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 9 0
	# float tf3(int a)    { return a; }
	.loc 2 8 0
	# float tf2(double a) { return a; }
	movsd -8(%rbp), %xmm0
	cvtpd2ps %xmm0, %xmm0
	leave
	ret
	leave
	ret
	.text
.global tf3
tf3:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 10 0
	# 
	.loc 2 9 0
	# float tf3(int a)    { return a; }
	movslq -8(%rbp), %rax
	cvtsi2ss %eax, %xmm0
	leave
	ret
	leave
	ret
	.text
.global td1
td1:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 12 0
	# double td2(double a) { return a; }
	.loc 2 10 0
	# 
	movss -8(%rbp), %xmm0
	cvtps2pd %xmm0, %xmm0
	leave
	ret
	leave
	ret
	.text
.global td2
td2:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 13 0
	# double td3(int a)    { return a; }
	.loc 2 12 0
	# double td2(double a) { return a; }
	movsd -8(%rbp), %xmm0
	leave
	ret
	leave
	ret
	.text
.global td3
td3:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 14 0
	# 
	.loc 2 13 0
	# double td3(int a)    { return a; }
	movslq -8(%rbp), %rax
	cvtsi2sd %eax, %xmm0
	leave
	ret
	leave
	ret
	.text
.global recursive
recursive:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 18 0
	# }
	.loc 2 17 0
	#     return recursive(3.33);
	.loc 2 14 0
	# 
	movsd -8(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 17 0
	#     return recursive(3.33);
	mov $10, %rax
	cvtsi2sd %eax, %xmm0
	movsd (%rsp), %xmm1
	add $8, %rsp
	ucomisd %xmm0, %xmm1
	setb %al
	movzb %al, %eax
	test %rax, %rax
	je .L3
	.loc 2 14 0
	# 
	movsd -8(%rbp), %xmm0
	leave
	ret
	.L3:
	.loc 2 18 0
	# }
	sub $8, %rsp
.data
	.L4:
	.quad 4614680912179589284
.text
	movsd .L4(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call recursive
	add $8, %rsp
	leave
	ret
	leave
	ret
	.data
	.lcomm .S0.buf, 128
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
	.loc 2 27 0
	# }
	.loc 2 23 0
	#     va_start(args, fmt);
	.loc 1 36 0
	# #define va_arg(ap, type)                                \
	.loc 2 23 0
	#     va_start(args, fmt);
	lea -208(%rbp), %rax
	push %rcx
	movl $8, (%rax)
	movl $48, 4(%rax)
	lea -176(%rbp), %rcx
	mov %rcx, 16(%rax)
	pop %rcx
	.loc 2 25 0
	#     va_end(args);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 2 22 0
	#     va_list args;
	lea .S0.buf(%rip), %rax
	push %rax
	.loc 2 25 0
	#     va_end(args);
	mov $128, %rax
	push %rax
	.loc 2 18 0
	# }
	mov -184(%rbp), %rax
	push %rax
	.loc 2 25 0
	#     va_end(args);
	.loc 2 23 0
	#     va_start(args, fmt);
	lea -208(%rbp), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call vsnprintf
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 1 45 0
	# #define va_copy(dest, src) ((dest)[0] = (src)[0])
	mov $1, %rax
	.loc 2 27 0
	# }
	.loc 2 22 0
	#     va_list args;
	lea .S0.buf(%rip), %rax
	leave
	ret
	leave
	ret
	.text
.global fmtint
fmtint:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 30 0
	# char *fmtdbl(double x) { return fmt("%a", x); }
	push %rdi
	push %rsi
	sub $8, %rsp
.data
	.L5:
	.string "%d"
.text
	lea .L5(%rip), %rax
	push %rax
	.loc 2 27 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	pop %rsi
	pop %rdi
	mov $0, %eax
	call fmt
	add $8, %rsp
	pop %rsi
	pop %rdi
	leave
	ret
	leave
	ret
	.text
.global fmtdbl
fmtdbl:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 31 0
	# 
	push %rdi
.data
	.L6:
	.string "%a"
.text
	lea .L6(%rip), %rax
	push %rax
	.loc 2 30 0
	# char *fmtdbl(double x) { return fmt("%a", x); }
	movsd -8(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rdi
	mov $1, %eax
	call fmt
	pop %rdi
	leave
	ret
	leave
	ret
	.text
.global std
std:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 74 0
	# #endif
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L8:
	.string "21"
.text
	lea .L8(%rip), %rax
	push %rax
	push %rdi
	mov $21, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L10:
	.string "0"
.text
	lea .L10(%rip), %rax
	push %rax
	push %rdi
	mov $0, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L12:
	.string "2"
.text
	lea .L12(%rip), %rax
	push %rax
	push %rdi
	mov $2, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L13:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L13(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L14:
	.string "1"
.text
	lea .L14(%rip), %rax
	push %rax
	push %rdi
	mov $1, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L16:
	.string "6"
.text
	lea .L16(%rip), %rax
	push %rax
	push %rdi
	mov $6, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L18:
	.string "0x1p-23"
.text
	lea .L18(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L19:
	.quad 4503599627370496000
.text
	movsd .L19(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L21:
	.string "24"
.text
	lea .L21(%rip), %rax
	push %rax
	push %rdi
	mov $24, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L23:
	.string "0x1.fffffep+127"
.text
	lea .L23(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L24:
	.quad 5183643170566569984
.text
	movsd .L24(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L26:
	.string "38"
.text
	lea .L26(%rip), %rax
	push %rax
	push %rdi
	mov $38, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L27:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L27(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L28:
	.string "128"
.text
	lea .L28(%rip), %rax
	push %rax
	push %rdi
	mov $128, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L30:
	.string "0x1p-126"
.text
	lea .L30(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L31:
	.quad 4039728865751334912
.text
	movsd .L31(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L33:
	.string "-37"
.text
	lea .L33(%rip), %rax
	push %rax
	push %rdi
	mov $0, %rax
	push %rax
	mov $37, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L35:
	.string "-125"
.text
	lea .L35(%rip), %rax
	push %rax
	push %rdi
	mov $0, %rax
	push %rax
	mov $125, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L36:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L36(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	movl $1, -8(%rbp)
	lea -8(%rbp), %rax
	movss 0(%rax), %xmm0
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L37:
	.quad 3936146074321813504
.text
	movsd .L37(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L39:
	.string "0x1p-149"
.text
	lea .L39(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L40:
	.quad 3936146074321813504
.text
	movsd .L40(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L42:
	.string "15"
.text
	lea .L42(%rip), %rax
	push %rax
	push %rdi
	mov $15, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L43:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L43(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L44:
	.string "0x1p-52"
.text
	lea .L44(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L45:
	.quad 4372995238176751616
.text
	movsd .L45(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L46:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L46(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L47:
	.string "53"
.text
	lea .L47(%rip), %rax
	push %rax
	push %rdi
	mov $53, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L49:
	.string "0x1.fffffffffffffp+1023"
.text
	lea .L49(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L50:
	.quad 9218868437227405311
.text
	movsd .L50(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L52:
	.string "308"
.text
	lea .L52(%rip), %rax
	push %rax
	push %rdi
	mov $308, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L54:
	.string "1024"
.text
	lea .L54(%rip), %rax
	push %rax
	push %rdi
	mov $1024, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L56:
	.string "0x1p-1022"
.text
	lea .L56(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L57:
	.quad 4503599627370496
.text
	movsd .L57(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L59:
	.string "-307"
.text
	lea .L59(%rip), %rax
	push %rax
	push %rdi
	mov $0, %rax
	push %rax
	mov $307, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
.data
	.L61:
	.string "-1021"
.text
	lea .L61(%rip), %rax
	push %rax
	push %rdi
	mov $0, %rax
	push %rax
	mov $1021, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L62:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L62(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	movl $1, -16(%rbp)
	movl $0, -12(%rbp)
	lea -16(%rbp), %rax
	movsd 0(%rax), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L63:
	.quad 1
.text
	movsd .L63(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L65:
	.string "0x0.0000000000001p-1022"
.text
	lea .L65(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L66:
	.quad 1
.text
	movsd .L66(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L67:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L67(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L68:
	.string "15"
.text
	lea .L68(%rip), %rax
	push %rax
	push %rdi
	mov $15, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L69:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L69(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L70:
	.string "0x1p-52"
.text
	lea .L70(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L71:
	.quad 4372995238176751616
.text
	movsd .L71(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L72:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L72(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L73:
	.string "53"
.text
	lea .L73(%rip), %rax
	push %rax
	push %rdi
	mov $53, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L74:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L74(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L75:
	.string "0x1.fffffffffffffp+1023"
.text
	lea .L75(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L76:
	.quad 9218868437227405311
.text
	movsd .L76(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L77:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L77(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L78:
	.string "308"
.text
	lea .L78(%rip), %rax
	push %rax
	push %rdi
	mov $308, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L79:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L79(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L80:
	.string "1024"
.text
	lea .L80(%rip), %rax
	push %rax
	push %rdi
	mov $1024, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L81:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L81(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L82:
	.string "0x1p-1022"
.text
	lea .L82(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L83:
	.quad 4503599627370496
.text
	movsd .L83(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L84:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L84(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L85:
	.string "-307"
.text
	lea .L85(%rip), %rax
	push %rax
	push %rdi
	mov $0, %rax
	push %rax
	mov $307, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	.L86:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L86(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L87:
	.string "-1021"
.text
	lea .L87(%rip), %rax
	push %rax
	push %rdi
	mov $0, %rax
	push %rax
	mov $1021, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	push %rax
	pop %rdi
	call fmtint
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
.data
	.L88:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L88(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	movl $1, -24(%rbp)
	movl $0, -20(%rbp)
	lea -24(%rbp), %rax
	movsd 0(%rax), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L89:
	.quad 1
.text
	movsd .L89(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L91:
	.string "0x0.0000000000001p-1022"
.text
	lea .L91(%rip), %rax
	push %rax
	sub $8, %rsp
.data
	.L92:
	.quad 1
.text
	movsd .L92(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call fmtdbl
	add $8, %rsp
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string
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
	sub $32, %rsp
	.loc 2 118 0
	# }
	.loc 2 79 0
	#     std();
	push %rdi
	sub $8, %rsp
.data
	.L93:
	.string "float"
.text
	lea .L93(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 2 80 0
	# 
	call std
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L94:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L94(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L95:
	.quad 4604480259023595110
.text
	movsd .L95(%rip), %xmm0
	cvttsd2si %xmm0, %eax
	push %rax
.data
	.L96:
	.quad 4604480259023595110
.text
	movsd .L96(%rip), %xmm0
	cvttsd2si %xmm0, %eax
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
	.loc 2 83 0
	#     float v2 = v1;
.data
	.L97:
	.quad 4621819117588971520
.text
	movsd .L97(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	movss %xmm0, -8(%rbp)
	.loc 2 84 0
	#     expectf(10.0, v1);
	.loc 2 83 0
	#     float v2 = v1;
	movss -8(%rbp), %xmm0
	movss %xmm0, -16(%rbp)
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L98:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L98(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L99:
	.quad 4621819117588971520
.text
	movsd .L99(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 83 0
	#     float v2 = v1;
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L100:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L100(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L101:
	.quad 4621819117588971520
.text
	movsd .L101(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 84 0
	#     expectf(10.0, v1);
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
	.loc 2 87 0
	#     double v3 = 20.0;
	leave
	ret
	.loc 2 88 0
	#     double v4 = v3;
	movl $0, -24(%rbp)
	movl $1077149696, -20(%rbp)
	.loc 2 89 0
	#     expectd(20.0, v3);
	.loc 2 88 0
	#     double v4 = v3;
	movsd -24(%rbp), %xmm0
	movsd %xmm0, -32(%rbp)
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L102:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L102(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L103:
	.quad 4626322717216342016
.text
	movsd .L103(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 88 0
	#     double v4 = v3;
	movsd -24(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L104:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L104(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L105:
	.quad 4626322717216342016
.text
	movsd .L105(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	.loc 2 89 0
	#     expectd(20.0, v3);
	movsd -32(%rbp), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
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
	sub $8, %rsp
.data
	.L106:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L106(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L107:
	.quad 4607182418800017408
.text
	movsd .L107(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L108:
	.quad 4607182418800017408
.text
	movsd .L108(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L109:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L109(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L110:
	.quad 4609434218613702656
.text
	movsd .L110(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L111:
	.quad 4607182418800017408
.text
	movsd .L111(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L112:
	.quad 4602678819172646912
.text
	movsd .L112(%rip), %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	addsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L113:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L113(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L114:
	.quad 4602678819172646912
.text
	movsd .L114(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L115:
	.quad 4607182418800017408
.text
	movsd .L115(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L116:
	.quad 4602678819172646912
.text
	movsd .L116(%rip), %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	subsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L117:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L117(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L118:
	.quad 4611686018427387904
.text
	movsd .L118(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L119:
	.quad 4607182418800017408
.text
	movsd .L119(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L120:
	.quad 4611686018427387904
.text
	movsd .L120(%rip), %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	mulsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L121:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L121(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L122:
	.quad 4598175219545276416
.text
	movsd .L122(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L123:
	.quad 4607182418800017408
.text
	movsd .L123(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L124:
	.quad 4616189618054758400
.text
	movsd .L124(%rip), %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	divsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L125:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L125(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L126:
	.quad 4613937818241073152
.text
	movsd .L126(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L127:
	.quad 4607182418800017408
.text
	movsd .L127(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $2, %rax
	cvtsi2sd %eax, %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	addsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L128:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L128(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L129:
	.quad 4612811918334230528
.text
	movsd .L129(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $5, %rax
	cvtsi2sd %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L130:
	.quad 4612811918334230528
.text
	movsd .L130(%rip), %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	subsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L131:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L131(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L132:
	.quad 4611686018427387904
.text
	movsd .L132(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L133:
	.quad 4607182418800017408
.text
	movsd .L133(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $2, %rax
	cvtsi2sd %eax, %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	mulsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L134:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L134(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L135:
	.quad 4598175219545276416
.text
	movsd .L135(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L136:
	.quad 4607182418800017408
.text
	movsd .L136(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	mov $4, %rax
	cvtsi2sd %eax, %xmm0
	movsd %xmm0, %xmm1
	movsd (%rsp), %xmm0
	add $8, %rsp
	divsd %xmm1, %xmm0
	cvtpd2ps %xmm0, %xmm0
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L137:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L137(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L138:
	.quad 4622100592565682176
.text
	movsd .L138(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
.data
	.L139:
	.quad 4622100592565682176
.text
	movsd .L139(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call tf1
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L140:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L140(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L141:
	.quad 4621819117588971520
.text
	movsd .L141(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	mov $10, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call tf1
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L142:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L142(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L143:
	.quad 4622156887561024307
.text
	movsd .L143(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
.data
	.L144:
	.quad 4622156887561024307
.text
	movsd .L144(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call tf2
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L145:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L145(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L146:
	.quad 4621819117588971520
.text
	movsd .L146(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	mov $10, %rax
	cvtsi2sd %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call tf2
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L147:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L147(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L148:
	.quad 4621819117588971520
.text
	movsd .L148(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	push %rdi
.data
	.L149:
	.quad 4622213182556366438
.text
	movsd .L149(%rip), %xmm0
	cvttsd2si %xmm0, %eax
	push %rax
	pop %rdi
	call tf3
	pop %rdi
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
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L150:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L150(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L151:
	.quad 4621819117588971520
.text
	movsd .L151(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	push %rdi
	mov $10, %rax
	push %rax
	pop %rdi
	call tf3
	pop %rdi
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
	.loc 3 23 0
	# #define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L152:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L152(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L153:
	.quad 4607182418800017408
.text
	movsd .L153(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
.data
	.L154:
	.quad 4607182418800017408
.text
	movsd .L154(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call tf1
	add $8, %rsp
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L155:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L155(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L156:
	.quad 4621819117588971520
.text
	movsd .L156(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	mov $10, %rax
	cvtsi2ss %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call tf1
	add $8, %rsp
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L157:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L157(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L158:
	.quad 4611686018427387904
.text
	movsd .L158(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
.data
	.L159:
	.quad 4611686018427387904
.text
	movsd .L159(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call tf2
	add $8, %rsp
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L160:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L160(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L161:
	.quad 4621819117588971520
.text
	movsd .L161(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	mov $10, %rax
	cvtsi2sd %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call tf2
	add $8, %rsp
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L162:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L162(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L163:
	.quad 4622382067542392832
.text
	movsd .L163(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	push %rdi
.data
	.L164:
	.quad 4622663542519103488
.text
	movsd .L164(%rip), %xmm0
	cvttsd2si %xmm0, %eax
	push %rax
	pop %rdi
	call tf3
	pop %rdi
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L165:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L165(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L166:
	.quad 4621819117588971520
.text
	movsd .L166(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	push %rdi
	mov $10, %rax
	push %rax
	pop %rdi
	call tf3
	pop %rdi
	cvtps2pd %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L167:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L167(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L168:
	.quad 4614680912179589284
.text
	movsd .L168(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	sub $8, %rsp
	mov $100, %rax
	cvtsi2sd %eax, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm0
	add $8, %rsp
	call recursive
	add $8, %rsp
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectd
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	leave
	ret
