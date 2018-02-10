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
	.data
	.global defaultint
	.lcomm defaultint, 4
	.data 0
.global val
val:
	.long 21
	.data 0
.global p1
p1:
	.quad val
	.data
	.global a1
	.lcomm a1, 12
	.data 0
.global a2
a2:
	.long 24
	.long 25
	.long 26
	.data
	.global x1
	.lcomm x1, 4
	.data
	.global x2
	.lcomm x2, 4
	.data
	.global x3
	.lcomm x3, 4
	.data 0
.global x4
x4:
	.long 4
	.data 0
.global x5
x5:
	.long 5
	.data
	.global x6
	.lcomm x6, 4
	.data 0
.global s1
s1:
	.byte 97
	.byte 98
	.byte 99
	.byte 100
	.byte 0
	.data 0
.global s2
s2:
	.data 1
	.L1:
	.string "ABCD"
	.data 0
	.quad .L1
	.data 0
.global l1
l1:
	.quad 8
	.data 0
.global intp
intp:
	.data 1
	.L2:
	.long 9
	.data 0
	.quad .L2
	.text
.global testmain
testmain:
	nop
	push %rbp
	mov %rsp, %rbp
	.file 2 "/home/vagrant/rucc/spec/targets/global.c"
	.loc 2 51 0
	# }
	.loc 2 22 0
	# 
	push %rdi
	sub $8, %rsp
.data
	.L3:
	.string "global variable"
.text
	lea .L3(%rip), %rax
	push %rax
	pop %rdi
	call print@PLT
	add $8, %rsp
	pop %rdi
	.loc 2 24 0
	#     expect(3, defaultint);
	mov $3, %rax
	cltq
	mov %eax, defaultint+0(%rip)
	.file 3 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $3, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq defaultint+0(%rip), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
	push %rdi
	push %rsi
	push %rdx
	push %rcx
.data
	.L5:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L5(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
	mov $21, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq val+0(%rip), %rax
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
	.loc 2 28 0
	#     expect(22, val);
	mov $22, %rax
	cltq
	mov %eax, val+0(%rip)
	.loc 3 20 0
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
	.loc 1 33 0
	# }
	movslq val+0(%rip), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $22, %rax
	push %rax
	.loc 1 33 0
	# }
	mov p1+0(%rip), %rax
	movslq 0(%rax), %rax
	cltq
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
	.loc 2 32 0
	#     expect(23, a1[1]);
	mov $23, %rax
	cltq
	push %rax
	.loc 1 33 0
	# }
	lea a1(%rip), %rax
	push %rcx
	push %rax
	.loc 2 32 0
	#     expect(23, a1[1]);
	mov $1, %rax
	imul $4, %rax
	mov %rax, %rcx
	pop %rax
	add %rcx, %rax
	pop %rcx
	mov (%rsp), %rcx
	mov %ecx, (%rax)
	pop %rax
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
	mov $23, %rax
	push %rax
	.loc 1 33 0
	# }
	lea a1(%rip), %rax
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
	mov $25, %rax
	push %rax
	.loc 1 33 0
	# }
	lea a2(%rip), %rax
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
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 2 36 0
	#     x2 = 2;
	mov $1, %rax
	cltq
	mov %eax, x1+0(%rip)
	.loc 2 37 0
	#     expect(1, x1);
	mov $2, %rax
	cltq
	mov %eax, x2+0(%rip)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $1, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq x1+0(%rip), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $2, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq x2+0(%rip), %rax
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
	.loc 2 40 0
	#     expect(3, x3);
	mov $3, %rax
	cltq
	mov %eax, x3+0(%rip)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $3, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq x3+0(%rip), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $4, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq x4+0(%rip), %rax
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
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $5, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq x5+0(%rip), %rax
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
	.loc 2 44 0
	#     expect(6, x6);
	mov $6, %rax
	cltq
	mov %eax, x6+0(%rip)
	.loc 3 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $6, %rax
	push %rax
	.loc 1 33 0
	# }
	movslq x6+0(%rip), %rax
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
	.L16:
	.string "/home/vagrant/rucc/spec/targets/test.h"
.text
	lea .L16(%rip), %rax
	push %rax
	mov $25, %rax
	push %rax
.data
	.L17:
	.string "abcd"
.text
	lea .L17(%rip), %rax
	push %rax
	.loc 1 33 0
	# }
	lea s1(%rip), %rax
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
	.loc 3 21 0
	# #define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
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
	.string "ABCD"
.text
	lea .L19(%rip), %rax
	push %rax
	.loc 1 33 0
	# }
	mov s2+0(%rip), %rax
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
	.loc 3 24 0
	# 
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
	mov $8, %rax
	cltq
	push %rax
	.loc 1 33 0
	# }
	mov l1+0(%rip), %rax
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpectl@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 24 0
	# 
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
	mov $9, %rax
	cltq
	push %rax
	.loc 1 33 0
	# }
	mov intp+0(%rip), %rax
	movslq 0(%rax), %rax
	cltq
	cltq
	push %rax
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	call fexpectl@PLT
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	leave
	ret
