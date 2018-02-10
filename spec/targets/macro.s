	.text
__bswap_16:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.file 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
	.loc 1 47 0
	# }
	movswq -8(%rbp), %rax
	movzwq %ax, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %eax
	movzwq %ax, %rax
	push %rax
	mov $255, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	movswq -8(%rbp), %rax
	movzwq %ax, %rax
	push %rax
	mov $255, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
	pop %rcx
	or %rcx, %rax
	cltq
	movzwq %ax, %rax
	leave
	ret
	leave
	ret
	.text
__bswap_32:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.file 2 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.loc 2 90 0
	# }
	.loc 1 47 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 90 0
	# }
	mov $4278190080, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $24, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %eax
	push %rax
	.loc 1 47 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 90 0
	# }
	mov $16711680, %rax
	cltq
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %eax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 1 47 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 90 0
	# }
	mov $65280, %rax
	cltq
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 1 47 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	.loc 2 90 0
	# }
	mov $255, %rax
	cltq
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $24, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
	pop %rcx
	or %rcx, %rax
	mov %eax, %eax
	leave
	ret
	leave
	ret
	.text
__bswap_64:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	.loc 2 151 0
	# }
	.loc 2 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 2 151 0
	# }
	mov $18374686479671623680, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $56, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %rax
	push %rax
	.loc 2 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 2 151 0
	# }
	mov $71776119061217280, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $40, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 2 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 2 151 0
	# }
	mov $280375465082880, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $24, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 2 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 2 151 0
	# }
	mov $1095216660480, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	shr %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 2 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 2 151 0
	# }
	mov $4278190080, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $8, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 2 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 2 151 0
	# }
	mov $16711680, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $24, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 2 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 2 151 0
	# }
	mov $65280, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $40, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %rax
	pop %rcx
	or %rcx, %rax
	push %rax
	.loc 2 90 0
	# }
	mov -8(%rbp), %rax
	push %rax
	.loc 2 151 0
	# }
	mov $255, %rax
	pop %rcx
	and %rcx, %rax
	push %rax
	mov $56, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %rax
	pop %rcx
	or %rcx, %rax
	leave
	ret
	leave
	ret
	.text
__va_arg_gp:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	sub $8, %rsp
	.file 3 "/home/vagrant/rucc/thirdparty/8cc/include/stdarg.h"
	.loc 3 23 0
	# }
	.loc 3 21 0
	#     ap->gp_offset += 8;
	.loc 2 151 0
	# }
	mov -8(%rbp), %rax
	mov 16(%rax), %rax
	push %rcx
	push %rax
	.loc 3 21 0
	#     ap->gp_offset += 8;
	.loc 2 151 0
	# }
	mov -8(%rbp), %rax
	movslq 0(%rax), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -16(%rbp)
	.loc 3 22 0
	#     return r;
	.loc 2 151 0
	# }
	mov -8(%rbp), %rax
	movslq 0(%rax), %rax
	push %rax
	.loc 3 22 0
	#     return r;
	mov $8, %rax
	cltq
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	mov %eax, %eax
	push %rax
	.loc 2 151 0
	# }
	mov -8(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
	.loc 3 23 0
	# }
	.loc 3 21 0
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
	.loc 3 29 0
	# }
	.loc 3 27 0
	#     ap->fp_offset += 16;
	.loc 3 23 0
	# }
	mov -8(%rbp), %rax
	mov 16(%rax), %rax
	push %rcx
	push %rax
	.loc 3 27 0
	#     ap->fp_offset += 16;
	.loc 3 23 0
	# }
	mov -8(%rbp), %rax
	movslq 4(%rax), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov %rax, -16(%rbp)
	.loc 3 28 0
	#     return r;
	.loc 3 23 0
	# }
	mov -8(%rbp), %rax
	movslq 4(%rax), %rax
	push %rax
	.loc 3 28 0
	#     return r;
	mov $16, %rax
	cltq
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	mov %eax, %eax
	push %rax
	.loc 3 23 0
	# }
	mov -8(%rbp), %rax
	mov (%rsp), %rcx
	mov %ecx, 4(%rax)
	pop %rax
	.loc 3 29 0
	# }
	.loc 3 27 0
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
	.loc 3 33 0
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
	.data
	.lcomm .S0.buf, 30
	.text
get_timestamp:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $144, %rsp
	.file 4 "/home/vagrant/rucc/spec/targets/macro.c"
	.loc 4 17 0
	# }
	.loc 4 13 0
	#     stat(__FILE__, &s);
	.loc 4 14 0
	#     setlocale(LC_ALL, "C");
	push %rdi
	push %rsi
.data
	.L0:
	.string "/home/vagrant/rucc/spec/targets/macro.c"
.text
	lea .L0(%rip), %rax
	push %rax
	lea -144(%rbp), %rax
	push %rax
	pop %rsi
	pop %rdi
	call stat@PLT
	pop %rsi
	pop %rdi
	.loc 4 15 0
	#     strftime(buf, 30, "%a %b %e %T %Y", localtime(&s.st_mtime));
	push %rdi
	push %rsi
	mov $6, %rax
	push %rax
.data
	.L1:
	.string "C"
.text
	lea .L1(%rip), %rax
	push %rax
	pop %rsi
	pop %rdi
	call setlocale@PLT
	pop %rsi
	pop %rdi
	.loc 4 16 0
	#     return buf;
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	.loc 4 12 0
	#     struct stat s;
	lea .S0.buf(%rip), %rax
	push %rax
	.loc 4 16 0
	#     return buf;
	mov $30, %rax
	cltq
	push %rax
.data
	.L2:
	.string "%a %b %e %T %Y"
.text
	lea .L2(%rip), %rax
	push %rax
	push %rdi
	lea -144(%rbp), %rax
	add $88, %rax
	add $0, %rax
	push %rax
	pop %rdi
	call localtime@PLT
	pop %rdi
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call strftime@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 4 17 0
	# }
	.loc 4 12 0
	#     struct stat s;
	lea .S0.buf(%rip), %rax
	leave
	ret
	leave
	ret
	.text
special:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 27 0
	#     // TODO(south37) Revert this: expect_string(get_timestamp(), __TIMESTAMP__);
	.file 5 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 5 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
	.string "test/macro.c"
.text
	lea .L4(%rip), %rax
	push %rax
.data
	.L5:
	.string "/home/vagrant/rucc/spec/targets/macro.c"
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
	.loc 5 20 0
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
	mov $22, %rax
	push %rax
	mov $22, %rax
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
	.L7:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L7(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	push %rdi
.data
	.L8:
	.string "Jan 21 2018"
.text
	lea .L8(%rip), %rax
	push %rax
	pop %rdi
	call strlen@PLT
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
	.L9:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L9(%rip), %rax
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
	.loc 5 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
	.string "test/macro.c"
.text
	lea .L11(%rip), %rax
	push %rax
.data
	.L12:
	.string "/home/vagrant/rucc/spec/targets/macro.c"
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
	leave
	ret
	.text
include:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 37 0
	#
	.loc 5 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
	.string "macro1"
.text
	lea .L14(%rip), %rax
	push %rax
.data
	.L15:
	.string "macro1"
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
	.string "macro2"
.text
	lea .L17(%rip), %rax
	push %rax
.data
	.L18:
	.string "macro2"
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
	leave
	ret
	.text
predefined:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 98 0
	# }
	.loc 5 20 0
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
	.L20:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L20(%rip), %rax
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
	.L21:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L21(%rip), %rax
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
	.L22:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L22(%rip), %rax
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
	.L23:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L23(%rip), %rax
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
	.L24:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L24(%rip), %rax
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
	.L25:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L25(%rip), %rax
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
	.L26:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L26(%rip), %rax
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
	.L27:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L27(%rip), %rax
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
	.L28:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L28(%rip), %rax
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
	.L29:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L29(%rip), %rax
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
	.L30:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L30(%rip), %rax
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
	.L31:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L31(%rip), %rax
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
	.L32:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L32(%rip), %rax
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
	.L33:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L33(%rip), %rax
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
	.L34:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L34(%rip), %rax
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
	.L35:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L35(%rip), %rax
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
	.L36:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L36(%rip), %rax
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
	.L37:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L37(%rip), %rax
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
	.L38:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L38(%rip), %rax
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
	.L39:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L39(%rip), %rax
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
	.L40:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L40(%rip), %rax
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
	.L41:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L41(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $201112, %rax
	push %rax
	mov $201112, %rax
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
	.L42:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L42(%rip), %rax
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
	.L43:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L43(%rip), %rax
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
	.L44:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L44(%rip), %rax
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
	.L45:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L45(%rip), %rax
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
	.L46:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L46(%rip), %rax
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
	.L47:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L47(%rip), %rax
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
	.L48:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L48(%rip), %rax
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
	.L49:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L49(%rip), %rax
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
	.L50:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L50(%rip), %rax
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
	.L53:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L53(%rip), %rax
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
	.L54:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L54(%rip), %rax
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
	.L55:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L55(%rip), %rax
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
	.L58:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L58(%rip), %rax
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
	.L59:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L59(%rip), %rax
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
	.L60:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L60(%rip), %rax
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
	.L61:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L61(%rip), %rax
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
	leave
	ret
	.text
simple:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 108 0
	# }
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	.L63:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L63(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
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
loop:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 4 118 0
	# }
	.loc 4 115 0
	#     int VAR2 = 2;
	movl $1, -8(%rbp)
	.loc 4 116 0
	#     expect(1, VAR1);
	movl $2, -16(%rbp)
	.loc 5 20 0
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
	mov $1, %rax
	push %rax
	.loc 4 115 0
	#     int VAR2 = 2;
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
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $2, %rax
	push %rax
	.loc 4 116 0
	#     expect(1, VAR1);
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
undef:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 4 128 0
	# #undef a
	.loc 4 122 0
	# #define a 10
	movl $3, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $10, %rax
	push %rax
	mov $10, %rax
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
	.L67:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L67(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $3, %rax
	push %rax
	.loc 4 122 0
	# #define a 10
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
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $16, %rax
	push %rax
	mov $16, %rax
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
cond_incl:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 4 194 0
	# }
	.loc 4 133 0
	# #if 0
	movl $1, -8(%rbp)
	.loc 5 20 0
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
	mov $1, %rax
	push %rax
	.loc 4 133 0
	# #if 0
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
	.loc 4 152 0
	# #endif
	mov $5, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	.loc 4 133 0
	# #if 0
	movslq -8(%rbp), %rax
	push %rax
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $5, %rax
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
	.loc 4 158 0
	# #endif
	mov $2, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
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
	mov $2, %rax
	push %rax
	.loc 4 133 0
	# #if 0
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
	.loc 4 163 0
	# #elif 1
	mov $3, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
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
	mov $3, %rax
	push %rax
	.loc 4 133 0
	# #if 0
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
	.loc 4 170 0
	# #endif
	mov $5, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $5, %rax
	push %rax
	.loc 4 133 0
	# #if 0
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
	.loc 4 175 0
	# #else
	mov $10, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $10, %rax
	push %rax
	.loc 4 133 0
	# #if 0
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
	.loc 4 184 0
	# #endif
	mov $12, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L75:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L75(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12, %rax
	push %rax
	.loc 4 133 0
	# #if 0
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
	.loc 4 192 0
	# #endif
	mov $150, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L76:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L76(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $150, %rax
	push %rax
	.loc 4 133 0
	# #if 0
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
const_expr:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 4 282 0
	# }
	.loc 4 198 0
	# #if 0 + 1
	movl $1, -8(%rbp)
	.loc 4 200 0
	# #else
	mov $2, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $2, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 207 0
	# #else
	mov $4, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L78:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L78(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 215 0
	# #endif
	mov $100, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $100, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 220 0
	# #else
	mov $101, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L80:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L80(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $101, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 226 0
	# #else
	mov $102, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $102, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 233 0
	# #endif
	mov $103, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L82:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L82(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $103, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 239 0
	# #endif
	mov $104, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L83:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L83(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $104, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 252 0
	# #endif
	mov $7, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $7, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 259 0
	# #endif
	mov $9, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L85:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L85(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $9, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 266 0
	# #endif
	mov $15, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $15, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 273 0
	# #endif
	mov $11, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L87:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L87(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
	.loc 4 278 0
	# #else
	mov $12, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L88:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L88(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $12, %rax
	push %rax
	.loc 4 198 0
	# #if 0 + 1
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
defined:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 4 300 0
	# }
	.loc 4 286 0
	# #if defined ZERO
	movl $0, -8(%rbp)
	.loc 4 288 0
	# #endif
	mov $1, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L89:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L89(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	.loc 4 286 0
	# #if defined ZERO
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
	.loc 4 292 0
	# #endif
	mov $2, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $2, %rax
	push %rax
	.loc 4 286 0
	# #if defined ZERO
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
	.loc 4 298 0
	# #endif
	mov $4, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L91:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L91(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $4, %rax
	push %rax
	.loc 4 286 0
	# #if defined ZERO
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
ifdef:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 4 333 0
	# }
	.loc 4 304 0
	# #ifdef ONE
	movl $0, -8(%rbp)
	.loc 4 306 0
	# #else
	mov $1, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L92:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L92(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	.loc 4 304 0
	# #ifdef ONE
	movslq -8(%rbp), %rax
	push %rax
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $1, %rax
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
	.loc 4 317 0
	# #endif
	mov $4, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L93:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L93(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	.loc 4 304 0
	# #ifdef ONE
	movslq -8(%rbp), %rax
	push %rax
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $4, %rax
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
	.loc 4 324 0
	# #endif
	mov $6, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L94:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L94(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	.loc 4 304 0
	# #ifdef ONE
	movslq -8(%rbp), %rax
	push %rax
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $6, %rax
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
	.loc 4 329 0
	# #else
	mov $7, %rax
	cltq
	mov %eax, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
	sub $8, %rsp
.data
	.L95:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L95(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	.loc 4 304 0
	# #ifdef ONE
	movslq -8(%rbp), %rax
	push %rax
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	mov $7, %rax
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
.global plus
plus:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	.loc 4 337 0
	# }
	.loc 4 333 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
.global minus
minus:
	nop
	push %rbp
	mov %rsp, %rbp
	push %rdi
	push %rsi
	.loc 4 341 0
	# }
	.loc 4 337 0
	# }
	movslq -8(%rbp), %rax
	push %rax
	movslq -16(%rbp), %rax
	mov %rax, %rcx
	pop %rax
	sub %rcx, %rax
	cltq
	leave
	ret
	leave
	ret
	.text
funclike:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $16, %rsp
	.loc 4 450 0
	# }
	.loc 5 21 0
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
	.string "5"
.text
	lea .L97(%rip), %rax
	push %rax
.data
	.L98:
	.string "5"
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
	.string "x"
.text
	lea .L100(%rip), %rax
	push %rax
.data
	.L101:
	.string "x"
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
.data
	.L103:
	.string "x y"
.text
	lea .L103(%rip), %rax
	push %rax
.data
	.L104:
	.string "x y"
.text
	lea .L104(%rip), %rax
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
	.L105:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L105(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L106:
	.string "x y"
.text
	lea .L106(%rip), %rax
	push %rax
.data
	.L107:
	.string "x y"
.text
	lea .L107(%rip), %rax
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
	.L108:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L108(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L109:
	.string "x + y"
.text
	lea .L109(%rip), %rax
	push %rax
.data
	.L110:
	.string "x + y"
.text
	lea .L110(%rip), %rax
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
	.L111:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L111(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L112:
	.string "x + y"
.text
	lea .L112(%rip), %rax
	push %rax
.data
	.L113:
	.string "x + y"
.text
	lea .L113(%rip), %rax
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
	.L114:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L114(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L115:
	.string "x+y"
.text
	lea .L115(%rip), %rax
	push %rax
.data
	.L116:
	.string "x+y"
.text
	lea .L116(%rip), %rax
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
	.L117:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L117(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L118:
	.string "'a'"
.text
	lea .L118(%rip), %rax
	push %rax
.data
	.L119:
	.string "'a'"
.text
	lea .L119(%rip), %rax
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
	.L120:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L120(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L121:
	.string "'\\''"
.text
	lea .L121(%rip), %rax
	push %rax
.data
	.L122:
	.string "'\\''"
.text
	lea .L122(%rip), %rax
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
	.L123:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L123(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L124:
	.string "L'a'"
.text
	lea .L124(%rip), %rax
	push %rax
.data
	.L125:
	.string "L'a'"
.text
	lea .L125(%rip), %rax
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
	.L126:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L126(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L127:
	.string "U'a'"
.text
	lea .L127(%rip), %rax
	push %rax
.data
	.L128:
	.string "U'a'"
.text
	lea .L128(%rip), %rax
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
	.L129:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L129(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L130:
	.string "u'a'"
.text
	lea .L130(%rip), %rax
	push %rax
.data
	.L131:
	.string "u'a'"
.text
	lea .L131(%rip), %rax
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
	.L132:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L132(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L133:
	.string "\"abc\""
.text
	lea .L133(%rip), %rax
	push %rax
.data
	.L134:
	.string "\"abc\""
.text
	lea .L134(%rip), %rax
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
	.L135:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L135(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L136:
	.string "L\"abc\""
.text
	lea .L136(%rip), %rax
	push %rax
.data
	.L137:
	.string "L\"abc\""
.text
	lea .L137(%rip), %rax
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
	.L138:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L138(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L139:
	.string "U\"abc\""
.text
	lea .L139(%rip), %rax
	push %rax
.data
	.L140:
	.string "U\"abc\""
.text
	lea .L140(%rip), %rax
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
	.L141:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L141(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L142:
	.string "u\"abc\""
.text
	lea .L142(%rip), %rax
	push %rax
.data
	.L143:
	.string "u\"abc\""
.text
	lea .L143(%rip), %rax
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
	.L144:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L144(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L145:
	.string "u8\"abc\""
.text
	lea .L145(%rip), %rax
	push %rax
.data
	.L146:
	.string "u8\"abc\""
.text
	lea .L146(%rip), %rax
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
	.L147:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L147(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L148:
	.string "ZERO"
.text
	lea .L148(%rip), %rax
	push %rax
.data
	.L149:
	.string "ZERO"
.text
	lea .L149(%rip), %rax
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
	.L150:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L150(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L151:
	.string "1 2"
.text
	lea .L151(%rip), %rax
	push %rax
.data
	.L152:
	.string "1 2"
.text
	lea .L152(%rip), %rax
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
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L153:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L153(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $5, %rax
	push %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L154:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L154(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $7, %rax
	push %rax
	mov $5, %rax
	push %rax
	mov $2, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L155:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L155(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	push %rax
	push %rdi
	push %rsi
	sub $8, %rsp
	mov $5, %rax
	push %rax
	mov $3, %rax
	push %rax
	pop %rsi
	pop %rdi
	call plus@PLT
	add $8, %rsp
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
	.L156:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L156(%rip), %rax
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
	.L157:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L157(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $14, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $2, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $10, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L158:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L158(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $10, %rax
	push %rax
	mov $5, %rax
	push %rax
	mov $5, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L159:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L159(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $50, %rax
	push %rax
	mov $5, %rax
	push %rax
	mov $10, %rax
	mov %rax, %rcx
	pop %rax
	imul %rcx, %rax
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
	.L160:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L160(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $3, %rax
	mov %rax, %rcx
	pop %rax
	imul %rcx, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $3, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L161:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L161(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $17, %rax
	push %rax
	mov $5, %rax
	push %rax
	mov $10, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $1, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $1, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L162:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L162(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $20, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $18, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L163:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L163(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $25, %rax
	push %rax
	push %rdi
	push %rsi
	sub $8, %rsp
	mov $2, %rax
	push %rax
	mov $18, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	push %rax
	mov $5, %rax
	push %rax
	pop %rsi
	pop %rdi
	call plus@PLT
	add $8, %rsp
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
	.L164:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L164(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $11, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $3, %rax
	mov %rax, %rcx
	pop %rax
	imul %rcx, %rax
	push %rax
	push %rdi
	push %rsi
	mov $2, %rax
	push %rax
	mov $3, %rax
	push %rax
	pop %rsi
	pop %rdi
	call plus@PLT
	pop %rsi
	pop %rdi
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L165:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L165(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $31, %rax
	push %rax
	push %rdi
	push %rsi
	sub $8, %rsp
	mov $30, %rax
	push %rax
	mov $1, %rax
	push %rax
	pop %rsi
	pop %rdi
	call plus@PLT
	add $8, %rsp
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
	.L166:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L166(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $29, %rax
	push %rax
	push %rdi
	push %rsi
	sub $8, %rsp
	mov $30, %rax
	push %rax
	mov $1, %rax
	push %rax
	pop %rsi
	pop %rdi
	call minus@PLT
	add $8, %rsp
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
	.L167:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L167(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $0, %rax
	push %rax
	mov $1, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L168:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L168(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $2, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $1, %rax
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
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L169:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L169(%rip), %rax
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
	.L170:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L170(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $3, %rax
	mov %rax, %rcx
	pop %rax
	sal %cl, %eax
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
	.loc 5 22 0
	# #define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	sub $8, %rsp
	movsd %xmm1, (%rsp)
	sub $8, %rsp
.data
	.L171:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L171(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L172:
	.quad 4593527504729830064
.text
	movsd .L172(%rip), %xmm0
	cvtpd2ps %xmm0, %xmm0
	sub $8, %rsp
	movsd %xmm0, (%rsp)
.data
	.L173:
	.quad 4593527504729830064
.text
	movsd .L173(%rip), %xmm0
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
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L174:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L174(%rip), %rax
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
	.L175:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L175(%rip), %rax
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
	.L176:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L176(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $97, %rax
	push %rax
	mov $97, %rax
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
	.loc 5 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L177:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L177(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L178:
	.string "a\x00\x00\x00b\x00\x00\x00c\x00\x00\x00\x00\x00\x00"
.text
	lea .L178(%rip), %rax
	push %rax
.data
	.L179:
	.string "a\x00\x00\x00b\x00\x00\x00c\x00\x00\x00\x00\x00\x00"
.text
	lea .L179(%rip), %rax
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
	.L180:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L180(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L181:
	.string "a\x00\x00\x00b\x00\x00\x00c\x00\x00\x00\x00\x00\x00"
.text
	lea .L181(%rip), %rax
	push %rax
.data
	.L182:
	.string "a\x00\x00\x00b\x00\x00\x00c\x00\x00\x00\x00\x00\x00"
.text
	lea .L182(%rip), %rax
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
	.L183:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L183(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L184:
	.string "a\x00b\x00c\x00\x00"
.text
	lea .L184(%rip), %rax
	push %rax
.data
	.L185:
	.string "a\x00b\x00c\x00\x00"
.text
	lea .L185(%rip), %rax
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
	.L186:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L186(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L187:
	.string "abc"
.text
	lea .L187(%rip), %rax
	push %rax
.data
	.L188:
	.string "abc"
.text
	lea .L188(%rip), %rax
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
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L189:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L189(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $8, %rax
	push %rax
	mov $1, %rax
	push %rax
	mov $7, %rax
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
	.loc 5 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L190:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L190(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L191:
	.string "a"
.text
	lea .L191(%rip), %rax
	push %rax
.data
	.L192:
	.string "a"
.text
	lea .L192(%rip), %rax
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
	.L193:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L193(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L194:
	.string "x ## y"
.text
	lea .L194(%rip), %rax
	push %rax
.data
	.L195:
	.string "x ## y"
.text
	lea .L195(%rip), %rax
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
	.loc 4 427 0
	# #define m14(x) x
	movl $67, -8(%rbp)
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L196:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L196(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $67, %rax
	push %rax
	.loc 4 427 0
	# #define m14(x) x
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
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L197:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L197(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $67, %rax
	push %rax
	.loc 4 427 0
	# #define m14(x) x
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
	.loc 4 432 0
	# #define glue(x, y) x ## y
	movl $68, -16(%rbp)
	.loc 4 434 0
	#     expect(69, a);
	.loc 4 432 0
	# #define glue(x, y) x ## y
	movslq -16(%rbp), %rax
	push %rax
	add $1, %rax
	mov %eax, -16(%rbp)
	pop %rax
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L198:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L198(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $69, %rax
	push %rax
	.loc 4 432 0
	# #define glue(x, y) x ## y
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
	.loc 5 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L199:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L199(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L200:
	.string "aa A B aa C"
.text
	lea .L200(%rip), %rax
	push %rax
.data
	.L201:
	.string "aa A B aa C"
.text
	lea .L201(%rip), %rax
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
	.L202:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L202(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L203:
	.string "zA m10(a) A B m10(a) C"
.text
	lea .L203(%rip), %rax
	push %rax
.data
	.L204:
	.string "zA m10(a) A B m10(a) C"
.text
	lea .L204(%rip), %rax
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
	.L205:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L205(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L206:
	.string "a a"
.text
	lea .L206(%rip), %rax
	push %rax
.data
	.L207:
	.string "a a"
.text
	lea .L207(%rip), %rax
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
	.L208:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L208(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L209:
	.string "(a,a)"
.text
	lea .L209(%rip), %rax
	push %rax
.data
	.L210:
	.string "(a,a)"
.text
	lea .L210(%rip), %rax
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
	.L211:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L211(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L212:
	.string ".3 . 3"
.text
	lea .L212(%rip), %rax
	push %rax
.data
	.L213:
	.string ".3 . 3"
.text
	lea .L213(%rip), %rax
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
empty:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 459 0
	# }
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L214:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L214(%rip), %rax
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
	.L215:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L215(%rip), %rax
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
	.L216:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L216(%rip), %rax
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
	.L217:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L217(%rip), %rax
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
	leave
	ret
	.text
noarg:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 464 0
	# }
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $55, %rax
	push %rax
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
	leave
	ret
	.text
null:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 464 0
	# }
	leave
	ret
	.text
counter:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 474 0
	# }
	.loc 5 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L219:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L219(%rip), %rax
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
	.L220:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L220(%rip), %rax
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
	.L221:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L221(%rip), %rax
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
	leave
	ret
	.text
gnuext:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 491 0
	# }
	.loc 5 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
.data
	.L223:
	.string "2 + 18"
.text
	lea .L223(%rip), %rax
	push %rax
.data
	.L224:
	.string "2 + 18"
.text
	lea .L224(%rip), %rax
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
	.L225:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L225(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L226:
	.string "2 +"
.text
	lea .L226(%rip), %rax
	push %rax
.data
	.L227:
	.string "2 +"
.text
	lea .L227(%rip), %rax
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
	.L228:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L228(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L229:
	.string "(1)"
.text
	lea .L229(%rip), %rax
	push %rax
.data
	.L230:
	.string "(1)"
.text
	lea .L230(%rip), %rax
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
	.L231:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L231(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L232:
	.string "(1, 2)"
.text
	lea .L232(%rip), %rax
	push %rax
.data
	.L233:
	.string "(1, 2)"
.text
	lea .L233(%rip), %rax
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
	.L234:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L234(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L235:
	.string "[2 2]"
.text
	lea .L235(%rip), %rax
	push %rax
.data
	.L236:
	.string "[2 2]"
.text
	lea .L236(%rip), %rax
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
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 4 511 0
	# }
	.loc 4 495 0
	#     special();
	push %rdi
	sub $8, %rsp
.data
	.L237:
	.string "macros"
.text
	lea .L237(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 4 496 0
	#     include();
	call special@PLT
	.loc 4 497 0
	#     predefined();
	call include@PLT
	.loc 4 498 0
	#     simple();
	call predefined@PLT
	.loc 4 499 0
	#     loop();
	call simple@PLT
	.loc 4 500 0
	#     undef();
	call loop@PLT
	.loc 4 501 0
	#     cond_incl();
	call undef@PLT
	.loc 4 502 0
	#     const_expr();
	call cond_incl@PLT
	.loc 4 503 0
	#     defined();
	call const_expr@PLT
	.loc 4 504 0
	#     ifdef();
	call defined@PLT
	.loc 4 505 0
	#     funclike();
	call ifdef@PLT
	.loc 4 506 0
	#     empty();
	call funclike@PLT
	.loc 4 507 0
	#     noarg();
	call empty@PLT
	.loc 4 508 0
	#     null();
	call noarg@PLT
	.loc 4 509 0
	#     counter();
	call null@PLT
	.loc 4 510 0
	#     gnuext();
	call counter@PLT
	.loc 4 511 0
	# }
	call gnuext@PLT
	leave
	ret
