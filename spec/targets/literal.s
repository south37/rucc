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
test_char:
	nop
	push %rbp
	mov %rsp, %rbp
	.file 2 "/home/vagrant/rucc/spec/targets/literal.c"
	.loc 2 26 0
	# }
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
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
	mov $65, %rax
	push %rax
	mov $65, %rax
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
	.L9:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L9(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $97, %rax
	push %rax
	mov $97, %rax
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
	.L10:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L10(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	mov $7, %rax
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
	.L11:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L11(%rip), %rax
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
	.L12:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L12(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12, %rax
	push %rax
	mov $12, %rax
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
	.L13:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L13(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	mov $10, %rax
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
	mov $13, %rax
	push %rax
	mov $13, %rax
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
	.L15:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L15(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $9, %rax
	push %rax
	mov $9, %rax
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
	.L16:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L16(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	mov $11, %rax
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
	.L17:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L17(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $27, %rax
	push %rax
	mov $27, %rax
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
	.L18:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L18(%rip), %rax
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
	.L19:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L19(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	mov $7, %rax
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
	.L20:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L20(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $15, %rax
	push %rax
	mov $15, %rax
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
	.L21:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L21(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $99, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	push %rax
	mov $157, %rax
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
	.L22:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L22(%rip), %rax
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
	.L23:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L23(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	push %rax
	mov $255, %rax
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
	.L24:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L24(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $15, %rax
	push %rax
	mov $15, %rax
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
	.L25:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L25(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $18, %rax
	push %rax
	mov $18, %rax
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
test_string:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $80, %rsp
	.loc 2 48 0
	# }
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L27:
	.string "abc"
.text
	lea .L27(%rip), %rax
	push %rax
.data
	.L28:
	.string "abc"
.text
	lea .L28(%rip), %rax
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
	.L29:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L29(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L30:
	.string "abc"
.text
	lea .L30(%rip), %rax
	push %rax
.data
	.L31:
	.string "abc"
.text
	lea .L31(%rip), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $97, %rax
	push %rax
.data
	.L33:
	.string "abc"
.text
	lea .L33(%rip), %rax
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
.data
	.L35:
	.string "abc"
.text
	lea .L35(%rip), %rax
	push %rcx
	push %rax
	mov $3, %rax
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
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L37:
	.string "abcd"
.text
	lea .L37(%rip), %rax
	push %rax
.data
	.L38:
	.string "abcd"
.text
	lea .L38(%rip), %rax
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
	.L39:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L39(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L40:
	.string "abcdef"
.text
	lea .L40(%rip), %rax
	push %rax
.data
	.L41:
	.string "abcdef"
.text
	lea .L41(%rip), %rax
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
	.loc 2 37 0
	#     expect_string(expected, "Aa\a\b\f\n\r\t\v\e\7\17\235\xff\x012");
	movb $65, -16(%rbp)
	movb $97, -15(%rbp)
	movb $7, -14(%rbp)
	movb $8, -13(%rbp)
	movb $12, -12(%rbp)
	movb $10, -11(%rbp)
	movb $13, -10(%rbp)
	movb $9, -9(%rbp)
	movb $11, -8(%rbp)
	movb $27, -7(%rbp)
	movb $7, -6(%rbp)
	movb $15, -5(%rbp)
	mov $0, %rax
	push %rax
	mov $99, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	mov %al, -4(%rbp)
	mov $0, %rax
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	mov %al, -3(%rbp)
	movb $18, -2(%rbp)
	movb $0, -1(%rbp)
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
	.loc 2 37 0
	#     expect_string(expected, "Aa\a\b\f\n\r\t\v\e\7\17\235\xff\x012");
	lea -16(%rbp), %rax
	push %rax
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
.data
	.L43:
	.string "Aa\x07\b\f\n\r\t\x0b\x1b\x07\x0f\x9d\xff\x12"
.text
	lea .L43(%rip), %rax
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
	mov $99, %rax
	push %rax
	mov $99, %rax
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
	.L45:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L45(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12354, %rax
	push %rax
	mov $12354, %rax
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
	.L46:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L46(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12354, %rax
	push %rax
	mov $12354, %rax
	movzwq %ax, %rax
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
	.L47:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L47(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12354, %rax
	push %rax
	mov $12354, %rax
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
	.loc 2 45 0
	#     expect(10, L + u + U + u8);
	movl $1, -24(%rbp)
	movl $2, -32(%rbp)
	movl $3, -40(%rbp)
	movl $4, -48(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L48:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L48(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	.loc 2 45 0
	#     expect(10, L + u + U + u8);
	movslq -24(%rbp), %rax
	push %rax
	movslq -32(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq -40(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq -48(%rbp), %rax
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
	.loc 2 47 0
	#     expect(10, Lx + ux + Ux + u8x);
	movl $1, -56(%rbp)
	movl $2, -64(%rbp)
	movl $3, -72(%rbp)
	movl $4, -80(%rbp)
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
	mov $10, %rax
	push %rax
	.loc 2 47 0
	#     expect(10, Lx + ux + Ux + u8x);
	movslq -56(%rbp), %rax
	push %rax
	movslq -64(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq -72(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	movslq -80(%rbp), %rax
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
test_mbstring:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 74 0
	#
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L50:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L50(%rip), %rax
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
	.L51:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L51(%rip), %rax
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
	.L52:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L52(%rip), %rax
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
	.L53:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L53(%rip), %rax
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
	.L54:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L54(%rip), %rax
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
	.L55:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L55(%rip), %rax
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
	mov $16, %rax
	push %rax
	mov $16, %rax
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
	mov $16, %rax
	push %rax
	mov $16, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L62:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L62(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $16, %rax
	push %rax
	mov $16, %rax
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
	.L63:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L63(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $16, %rax
	push %rax
	mov $16, %rax
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
	.L64:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L64(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $16, %rax
	push %rax
	mov $16, %rax
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
	.L65:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L65(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	push %rdi
	push %rsi
	push %rdx
.data
	.L66:
	.string "x\x00\x00\x00y\x00\x00\x00z\x00\x00\x00\x00\x00\x00"
.text
	lea .L66(%rip), %rax
	push %rax
.data
	.L67:
	.string "x\x00\x00\x00y\x00\x00\x00z\x00\x00\x00\x00\x00\x00"
.text
	lea .L67(%rip), %rax
	push %rax
	mov $16, %rax
	cltq
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call memcmp@PLT
	pop %rdx
	pop %rsi
	pop %rdi
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
	.L68:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L68(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	push %rdi
	push %rsi
	push %rdx
.data
	.L69:
	.string "x\x00\x00\x00y\x00\x00\x00z\x00\x00\x00\x00\x00\x00"
.text
	lea .L69(%rip), %rax
	push %rax
.data
	.L70:
	.string "x\x00\x00\x00y\x00\x00\x00z\x00\x00\x00\x00\x00\x00"
.text
	lea .L70(%rip), %rax
	push %rax
	mov $16, %rax
	cltq
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call memcmp@PLT
	pop %rdx
	pop %rsi
	pop %rdi
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
	mov $0, %rax
	push %rax
	push %rdi
	push %rsi
	push %rdx
.data
	.L72:
	.string "x\x00y\x00z\x00\x00\x00"
.text
	lea .L72(%rip), %rax
	push %rax
.data
	.L73:
	.string "x\x00y\x00z\x00\x00"
.text
	lea .L73(%rip), %rax
	push %rax
	mov $8, %rax
	cltq
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call memcmp@PLT
	pop %rdx
	pop %rsi
	pop %rdi
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
	mov $0, %rax
	push %rax
	push %rdi
	push %rsi
	push %rdx
.data
	.L76:
	.string "\xe3\x81\x82\x00"
.text
	lea .L76(%rip), %rax
	push %rax
.data
	.L77:
	.string "\xe3\x81\x82"
.text
	lea .L77(%rip), %rax
	push %rax
	mov $4, %rax
	cltq
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call memcmp@PLT
	pop %rdx
	pop %rsi
	pop %rdi
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
	.L78:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L78(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12, %rax
	push %rax
	mov $12, %rax
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
	.L79:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L79(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $0, %rax
	push %rax
	push %rdi
	push %rsi
	push %rdx
.data
	.L80:
	.string "B0\x00\x00x\x00\x00\x00\x00\x00\x00\x00"
.text
	lea .L80(%rip), %rax
	push %rax
.data
	.L81:
	.string "B0\x00\x00x\x00\x00\x00\x00\x00\x00"
.text
	lea .L81(%rip), %rax
	push %rax
	mov $12, %rax
	cltq
	push %rax
	pop %rdx
	pop %rsi
	pop %rdi
	call memcmp@PLT
	pop %rdx
	pop %rsi
	pop %rdi
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
test_float:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 89 0
	# }
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L82:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L82(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L83:
	.quad 4607182418800017408
.text
	movsd .L83(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L84:
	.quad 4607182418800017408
.text
	movsd .L84(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf@PLT
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
	.L85:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L85(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L86:
	.quad 4607182418800017408
.text
	movsd .L86(%rip), %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L87:
	.quad 4607182418800017408
.text
	movsd .L87(%rip), %xmm0
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
	.loc 3 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L88:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L88(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L89:
	.quad 4607182418800017408
.text
	movsd .L89(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L90:
	.quad 4607182418800017408
.text
	movsd .L90(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf@PLT
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
	.L91:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L91(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L92:
	.quad 4607182418800017408
.text
	movsd .L92(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L93:
	.quad 4607182418800017408
.text
	movsd .L93(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
	movsd (%rsp), %xmm1
	add $8, %rsp
	movsd (%rsp), %xmm0
	add $8, %rsp
	pop %rsi
	pop %rdi
	call fexpectf@PLT
	add $8, %rsp
	movsd (%rsp), %xmm1
	add $8, %rsp
	pop %rsi
	pop %rdi
	leave
	ret
	.text
test_ucn:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 99 0
	# }
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
	mov $36, %rax
	push %rax
	mov $36, %rax
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
	.L95:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L95(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $36, %rax
	push %rax
	mov $36, %rax
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
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L96:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L96(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L97:
	.string "$"
.text
	lea .L97(%rip), %rax
	push %rax
.data
	.L98:
	.string "$"
.text
	lea .L98(%rip), %rax
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
	.L99:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L99(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L100:
	.string "$"
.text
	lea .L100(%rip), %rax
	push %rax
.data
	.L101:
	.string "$"
.text
	lea .L101(%rip), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L102:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L102(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $88, %rax
	push %rax
	mov $88, %rax
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
	.L103:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L103(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $88, %rax
	push %rax
	mov $88, %rax
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
	.L104:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L104(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $88, %rax
	push %rax
	mov $88, %rax
	movzwq %ax, %rax
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
.global g1
g1:
	.long 80
	.data 0
.global g2
g2:
	.data 1
	.L105:
	.long 81
	.data 0
	.quad .L105
	.data 0
.global g3
g3:
	.data 1
	.L106:
	.long 82
	.data 0
	.quad .L106
	.data 0
.global g4
g4:
	.data 1
	.L107:
	.byte 83
	.long 0
	.byte 0
	.byte 0
	.byte 0
	.data 2
	.L108:
	.long 84
	.long 85
	.data 1
	.quad .L108
	.long 0
	.byte 0
	.byte 0
	.byte 0
	.data 0
	.quad .L107
	.text
test_compound:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $56, %rsp
	.loc 2 118 0
	# }
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L109:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L109(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	movl $1, -8(%rbp)
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L110:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L110(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	movl $1, -24(%rbp)
	movl $2, -20(%rbp)
	movl $3, -16(%rbp)
	lea -24(%rbp), %rax
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
	.L111:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L111(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12, %rax
	push %rax
	mov $12, %rax
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
	.L112:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L112(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $6, %rax
	push %rax
	movl $5, -56(%rbp)
	movl $6, -52(%rbp)
	movl $7, -48(%rbp)
	lea -56(%rbp), %rax
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
	.L113:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L113(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $80, %rax
	push %rax
	.loc 2 99 0
	# }
	movslq g1+0(%rip), %rax
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
	.L114:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L114(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $81, %rax
	push %rax
	.loc 2 99 0
	# }
	mov g2+0(%rip), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L115:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L115(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $82, %rax
	push %rax
	.loc 2 99 0
	# }
	mov g3+0(%rip), %rax
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
	.L116:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L116(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $83, %rax
	push %rax
	.loc 2 99 0
	# }
	mov g4+0(%rip), %rax
	movsbq 0(%rax), %rax
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
	mov $84, %rax
	push %rax
	.loc 2 99 0
	# }
	mov g4+0(%rip), %rax
	mov 8(%rax), %rax
	lea 0(%rax), %rax
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
	.L118:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L118(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $85, %rax
	push %rax
	.loc 2 99 0
	# }
	mov g4+0(%rip), %rax
	mov 8(%rax), %rax
	lea 0(%rax), %rax
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
	.loc 2 128 0
	# }
	.loc 2 122 0
	#     test_char();
	push %rdi
	sub $8, %rsp
.data
	.L119:
	.string "literal"
.text
	lea .L119(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 123 0
	#     test_string();
	call test_char@PLT
	.loc 2 124 0
	#     test_mbstring();
	call test_string@PLT
	.loc 2 125 0
	#     test_float();
	call test_mbstring@PLT
	.loc 2 126 0
	#     test_ucn();
	call test_float@PLT
	.loc 2 127 0
	#     test_compound();
	call test_ucn@PLT
	.loc 2 128 0
	# }
	call test_compound@PLT
	leave
	ret
