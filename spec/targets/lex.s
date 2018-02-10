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
digraph:
	nop
	push %rbp
	mov %rsp, %rbp
	.file 2 "/home/vagrant/rucc/spec/targets/lex.c"
	.loc 2 25 0
	# #endif
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L1:
	.string "["
.text
	lea .L1(%rip), %rax
	push %rax
.data
	.L2:
	.string "["
.text
	lea .L2(%rip), %rax
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
	.L3:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L3(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L4:
	.string "]"
.text
	lea .L4(%rip), %rax
	push %rax
.data
	.L5:
	.string "]"
.text
	lea .L5(%rip), %rax
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
	.L6:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L6(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L7:
	.string "{"
.text
	lea .L7(%rip), %rax
	push %rax
.data
	.L8:
	.string "{"
.text
	lea .L8(%rip), %rax
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
	.L9:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L9(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L10:
	.string "}"
.text
	lea .L10(%rip), %rax
	push %rax
.data
	.L11:
	.string "}"
.text
	lea .L11(%rip), %rax
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
	.L12:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L12(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L13:
	.string "#"
.text
	lea .L13(%rip), %rax
	push %rax
.data
	.L14:
	.string "#"
.text
	lea .L14(%rip), %rax
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
	.L15:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L15(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L16:
	.string "% :"
.text
	lea .L16(%rip), %rax
	push %rax
.data
	.L17:
	.string "% :"
.text
	lea .L17(%rip), %rax
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
	.L18:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L18(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L19:
	.string "##"
.text
	lea .L19(%rip), %rax
	push %rax
.data
	.L20:
	.string "##"
.text
	lea .L20(%rip), %rax
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
	.L21:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L21(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L22:
	.string "#%"
.text
	lea .L22(%rip), %rax
	push %rax
.data
	.L23:
	.string "#%"
.text
	lea .L23(%rip), %rax
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
	.L24:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L24(%rip), %rax
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
	leave
	ret
	.text
escape:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 2 33 0
	# }
	.loc 2 30 0
	#     expect(10, val\
	movl $10, -8(%rbp)
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
	mov $10, %rax
	push %rax
	.loc 2 30 0
	#     expect(10, val\
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
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L27:
	.string "a   bc"
.text
	lea .L27(%rip), %rax
	push %rax
.data
	.L28:
	.string "a   bc"
.text
	lea .L28(%rip), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpect_string@PLT
	add $8, %rsp
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
	.text
whitespace:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 37 0
	# }
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
	.string "x y"
.text
	lea .L30(%rip), %rax
	push %rax
.data
	.L31:
	.string "x y"
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
	leave
	ret
	.text
newline:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 2 37 0
	# }
	leave
	ret
	.text
dollar:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $24, %rsp
	.loc 2 52 0
	# }
	.loc 2 47 0
	#     expect(1, $);
	movl $1, -8(%rbp)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $1, %rax
	push %rax
	.loc 2 47 0
	#     expect(1, $);
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
	.loc 2 49 0
	#     expect(2, $2);
	movl $2, -16(%rbp)
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
	mov $2, %rax
	push %rax
	.loc 2 49 0
	#     expect(2, $2);
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
	.loc 2 51 0
	#     expect(3, a$);
	movl $3, -24(%rbp)
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
	mov $3, %rax
	push %rax
	.loc 2 51 0
	#     expect(3, a$);
	movslq -24(%rbp), %rax
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
	.loc 2 61 0
	# }
	.loc 2 56 0
	#     digraph();
	push %rdi
	sub $8, %rsp
.data
	.L35:
	.string "lexer"
.text
	lea .L35(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 57 0
	#     escape();
	call digraph@PLT
	.loc 2 58 0
	#     whitespace();
	call escape@PLT
	.loc 2 59 0
	#     newline();
	call whitespace@PLT
	.loc 2 60 0
	#     dollar();
	call newline@PLT
	.loc 2 61 0
	# }
	call dollar@PLT
	leave
	ret
