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
	.file 2 "/home/vagrant/rucc/spec/targets/iso646.c"
	.loc 2 21 0
	# }
	.loc 2 10 0
	#     expect_string("&&", S(and));
	push %rdi
	sub $8, %rsp
.data
	.L0:
	.string "iso646"
.text
	lea .L0(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L2:
	.string "&&"
.text
	lea .L2(%rip), %rax
	push %rax
.data
	.L3:
	.string "&&"
.text
	lea .L3(%rip), %rax
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
	.L4:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L4(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L5:
	.string "&="
.text
	lea .L5(%rip), %rax
	push %rax
.data
	.L6:
	.string "&="
.text
	lea .L6(%rip), %rax
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
	.L7:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L7(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L8:
	.string "&"
.text
	lea .L8(%rip), %rax
	push %rax
.data
	.L9:
	.string "&"
.text
	lea .L9(%rip), %rax
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
	.L10:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L10(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L11:
	.string "|"
.text
	lea .L11(%rip), %rax
	push %rax
.data
	.L12:
	.string "|"
.text
	lea .L12(%rip), %rax
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
	.L13:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L13(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L14:
	.string "~"
.text
	lea .L14(%rip), %rax
	push %rax
.data
	.L15:
	.string "~"
.text
	lea .L15(%rip), %rax
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
	.L16:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L16(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L17:
	.string "!"
.text
	lea .L17(%rip), %rax
	push %rax
.data
	.L18:
	.string "!"
.text
	lea .L18(%rip), %rax
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
	.L19:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L19(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L20:
	.string "!="
.text
	lea .L20(%rip), %rax
	push %rax
.data
	.L21:
	.string "!="
.text
	lea .L21(%rip), %rax
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
	.L22:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L22(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L23:
	.string "||"
.text
	lea .L23(%rip), %rax
	push %rax
.data
	.L24:
	.string "||"
.text
	lea .L24(%rip), %rax
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
	.L25:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L25(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L26:
	.string "|="
.text
	lea .L26(%rip), %rax
	push %rax
.data
	.L27:
	.string "|="
.text
	lea .L27(%rip), %rax
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
	.L28:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L28(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L29:
	.string "^"
.text
	lea .L29(%rip), %rax
	push %rax
.data
	.L30:
	.string "^"
.text
	lea .L30(%rip), %rax
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
	.L31:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L31(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L32:
	.string "^="
.text
	lea .L32(%rip), %rax
	push %rax
.data
	.L33:
	.string "^="
.text
	lea .L33(%rip), %rax
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
