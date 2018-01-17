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
	mov %eax, %rax
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
	mov %eax, %rax
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
test_type:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $112, %rsp
	.file 2 "/home/vagrant/rucc/thirdparty/8cc/include/stdbool.h"
	.loc 2 6 0
	# #define true 1
	.file 3 "/home/vagrant/rucc/spec/targets/type.c"
	.loc 3 8 0
	#     short b;
	.loc 3 9 0
	#     int c;
	.loc 3 10 0
	#     long d;
	.loc 3 11 0
	#     long long e;
	.loc 3 12 0
	#     short int f;
	.loc 3 13 0
	#     long int g;
	.loc 3 14 0
	#     long long int h;
	.loc 3 15 0
	#     long int long i;
	.loc 3 16 0
	#     float j;
	.loc 3 17 0
	#     double k;
	.loc 3 18 0
	#     long double l;
	.loc 3 19 0
	#     _Bool m;
	.loc 3 20 0
	#     bool n;
	.loc 2 6 0
	# #define true 1
	leave
	ret
	.text
test_signed:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $64, %rsp
	.loc 3 32 0
	# }
	.loc 3 25 0
	#     signed short b;
	.loc 3 26 0
	#     signed int c;
	.loc 3 27 0
	#     signed long d;
	.loc 3 28 0
	#     signed long long e;
	.loc 3 29 0
	#     signed short int f;
	.loc 3 30 0
	#     signed long int g;
	.loc 3 31 0
	#     signed long long int h;
	.loc 3 32 0
	# }
	leave
	ret
	.text
test_unsigned:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $64, %rsp
	.loc 3 43 0
	# }
	.loc 3 36 0
	#     unsigned short b;
	.loc 3 37 0
	#     unsigned int c;
	.loc 3 38 0
	#     unsigned long d;
	.loc 3 39 0
	#     unsigned long long e;
	.loc 3 40 0
	#     unsigned short int f;
	.loc 3 41 0
	#     unsigned long int g;
	.loc 3 42 0
	#     unsigned long long int h;
	.loc 3 43 0
	# }
	leave
	ret
	.data
	.lcomm .S0.a, 4
	.data
	.lcomm .S1.d, 4
	.text
test_storage_class:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $32, %rsp
	.loc 3 52 0
	# }
	.loc 3 48 0
	#     register c;
	.loc 3 49 0
	#     static int d;
	.loc 3 51 0
	#     register int f;
	.loc 3 52 0
	# }
	leave
	ret
	.text
test_pointer:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $56, %rsp
	.loc 3 61 0
	# }
	.loc 3 56 0
	#     expect(8, sizeof(a));
	.file 4 "/home/vagrant/rucc/spec/targets/test.h"
	.loc 4 20 0
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
	mov $8, %rax
	push %rax
	mov $8, %rax
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
	.loc 3 58 0
	#     expect(40, sizeof(b));
	.loc 4 20 0
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
	mov $40, %rax
	push %rax
	mov $40, %rax
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
	.loc 3 60 0
	#     expect(8, sizeof(c));
	.loc 4 20 0
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
	mov $8, %rax
	push %rax
	mov $8, %rax
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
test_unusual_order:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $8, %rsp
	.loc 3 65 0
	# }
	leave
	ret
	.text
test_typedef:
	nop
	push %rbp
	mov %rsp, %rbp
	sub $64, %rsp
	.loc 3 91 0
	#     }
	.loc 3 70 0
	#     expect(5, a);
	movl $5, -8(%rbp)
	.loc 4 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $5, %rax
	push %rax
	.loc 3 70 0
	#     expect(5, a);
	movslq -8(%rbp), %rax
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
	.loc 3 74 0
	#     expect(2, b[1]);
	movl $1, -24(%rbp)
	movl $2, -20(%rbp)
	movl $3, -16(%rbp)
	.loc 4 20 0
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
	mov $2, %rax
	push %rax
	.loc 3 74 0
	#     expect(2, b[1]);
	lea -24(%rbp), %rax
	push %rcx
	push %rax
	.loc 4 20 0
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
	call fexpect
	pop %rcx
	pop %rdx
	pop %rsi
	pop %rdi
	.loc 3 78 0
	#     c.x = 5;
	.loc 3 79 0
	#     expect(5, c.x);
	mov $5, %rax
	cltq
	mov %eax, -32(%rbp)
	.loc 4 20 0
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
	mov $5, %rax
	push %rax
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
	.loc 3 85 0
	#     }
	.loc 3 84 0
	#         expect(3, x);
	movl $3, -40(%rbp)
	.loc 4 20 0
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
	mov $3, %rax
	push %rax
	.loc 3 84 0
	#         expect(3, x);
	movslq -40(%rbp), %rax
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
	.loc 3 91 0
	#     }
	.loc 3 88 0
	#         expect(1, a);
	mov $1, %rax
	mov %eax, -48(%rbp)
	movl $5, -56(%rbp)
	mov $4, %rax
	mov %eax, -64(%rbp)
	.loc 4 20 0
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
	mov $1, %rax
	push %rax
	.loc 3 88 0
	#         expect(1, a);
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
	.loc 4 20 0
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
	mov $5, %rax
	push %rax
	.loc 3 88 0
	#         expect(1, a);
	movslq -56(%rbp), %rax
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
	.loc 4 20 0
	# #define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
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
	mov $4, %rax
	push %rax
	.loc 3 88 0
	#         expect(1, a);
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
	leave
	ret
	.text
test_align:
	nop
	push %rbp
	mov %rsp, %rbp
	.loc 3 97 0
	# #endif
	.loc 4 20 0
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
	mov $8, %rax
	push %rax
	mov $8, %rax
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
	.loc 3 110 0
	# }
	.loc 3 102 0
	#     test_type();
	push %rdi
	sub $8, %rsp
.data
	.L11:
	.string "type system"
.text
	lea .L11(%rip), %rax
	push %rax
	pop %rdi
	call print
	add $8, %rsp
	pop %rdi
	.loc 3 103 0
	#     test_signed();
	call test_type
	.loc 3 104 0
	#     test_unsigned();
	call test_signed
	.loc 3 105 0
	#     test_storage_class();
	call test_unsigned
	.loc 3 106 0
	#     test_pointer();
	call test_storage_class
	.loc 3 107 0
	#     test_unusual_order();
	call test_pointer
	.loc 3 108 0
	#     test_typedef();
	call test_unusual_order
	.loc 3 109 0
	#     test_align();
	call test_typedef
	.loc 3 110 0
	# }
	call test_align
	leave
	ret
