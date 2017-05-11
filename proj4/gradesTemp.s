	.file	"gradesTemp.c"
	.text
.Ltext0:
	.comm	aGrades,4400,64
	.comm	bGrades,4400,64
	.comm	retBufferArea,5120,64
	.comm	retBuffer,8,8
	.comm	txtFile,8,8
	.section	.rodata
.LC0:
	.string	"mprotect failed"
.LC1:
	.string	"Choose section A or B: "
	.align 8
.LC2:
	.string	"Unable to determine which section you wanted."
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.file 1 "gradesTemp.c"
	.loc 1 24 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 28 0
	movl	$30, %edi
	call	sysconf
	movq	%rax, -8(%rbp)
	.loc 1 29 0
	movq	stdout(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	setbuf
	.loc 1 30 0
	movl	$retBufferArea, %eax
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	negq	%rax
	andq	%rdx, %rax
	movq	%rax, retBuffer(%rip)
	.loc 1 31 0
	movq	retBuffer(%rip), %rax
	movl	$7, %edx
	movl	$1024, %esi
	movq	%rax, %rdi
	call	mprotect
	testl	%eax, %eax
	je	.L2
	.loc 1 32 0
	movl	$.LC0, %edi
	call	puts
	.loc 1 33 0
	movl	$1, %eax
	jmp	.L9
.L2:
	.loc 1 35 0
	cmpl	$1, -36(%rbp)
	jne	.L4
	.loc 1 35 0 is_stmt 0 discriminator 1
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	time
	movl	%eax, %edi
	call	srand
	jmp	.L5
.L4:
.LBB2:
	.loc 1 37 0 is_stmt 1
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -12(%rbp)
	.loc 1 38 0
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	srand
.L5:
.LBE2:
	.loc 1 40 0
	movl	$36, %esi
	movl	$aGrades, %edi
	call	getGrades
	.loc 1 41 0
	movl	$54, %esi
	movl	$bGrades, %edi
	call	getGrades
	.loc 1 42 0
	movl	$36, %esi
	movl	$aGrades, %edi
	call	getAvg
	.loc 1 43 0
	movl	$54, %esi
	movl	$bGrades, %edi
	call	getAvg
	.loc 1 44 0
	movl	$bGrades, %edi
	call	changeGrade
	.loc 1 46 0
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	.loc 1 47 0
	movl	$0, %eax
	call	getUserLine
	movq	%rax, -24(%rbp)
	.loc 1 48 0
	movl	$10, %edi
	call	putchar
	.loc 1 51 0
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$65, %al
	jne	.L6
	.loc 1 52 0
	movl	$100, %edx
	movl	$36, %esi
	movl	$aGrades, %edi
	call	printGrades
	jmp	.L7
.L6:
	.loc 1 53 0
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$66, %al
	jne	.L8
	.loc 1 54 0
	movl	$200, %edx
	movl	$54, %esi
	movl	$bGrades, %edi
	call	printGrades
	jmp	.L7
.L8:
	.loc 1 56 0
	movl	$.LC2, %edi
	call	puts
.L7:
	.loc 1 59 0
	movl	$0, %edi
	call	exit
.L9:
	.loc 1 60 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.globl	changeGrade
	.type	changeGrade, @function
changeGrade:
.LFB3:
	.loc 1 61 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	.loc 1 62 0
	movl	$0, -4(%rbp)
	.loc 1 63 0
	movl	$11, -8(%rbp)
	.loc 1 64 0
	jmp	.L11
.L15:
	.loc 1 65 0
	cmpl	$3, -4(%rbp)
	jle	.L12
	.loc 1 65 0 is_stmt 0 discriminator 2
	cmpl	$7, -4(%rbp)
	jle	.L13
.L12:
	.loc 1 65 0 discriminator 3
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	$100, 144(%rax)
	jmp	.L14
.L13:
	.loc 1 67 0 is_stmt 1
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	subl	$1, %edx
	movl	%edx, 144(%rax)
.L14:
	.loc 1 69 0
	addl	$1, -4(%rbp)
.L11:
	.loc 1 64 0
	cmpl	$10, -4(%rbp)
	jle	.L15
	.loc 1 71 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	changeGrade, .-changeGrade
	.globl	getGrades
	.type	getGrades, @function
getGrades:
.LFB4:
	.loc 1 73 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	.loc 1 75 0
	movl	$0, -20(%rbp)
	jmp	.L17
.L18:
	.loc 1 76 0 discriminator 3
	call	rand
	movl	%eax, %ecx
	movl	$-1600085855, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$51, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	40(%rax), %ecx
	movq	-40(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	.loc 1 77 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	400(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$-1600085855, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$51, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	30(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	.loc 1 78 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	800(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$-2078209981, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$4, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$5, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	leal	60(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	.loc 1 79 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	1200(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$680390859, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$4, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$101, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, (%rbx,%rdx,4)
	.loc 1 80 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	1600(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	.loc 1 81 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	2000(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	.loc 1 82 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	2400(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	.loc 1 83 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	2800(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	.loc 1 84 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	3200(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1041204193, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$4, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	sall	$5, %edx
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	30(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	.loc 1 85 0 discriminator 3
	movq	-40(%rbp), %rax
	leaq	3600(%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%rdx,%rcx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	leal	0(,%rdx,8), %eax
	movl	%eax, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	40(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	.loc 1 75 0 discriminator 3
	addl	$1, -20(%rbp)
.L17:
	.loc 1 75 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L18
	.loc 1 87 0 is_stmt 1
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	getGrades, .-getGrades
	.globl	getAvg
	.type	getAvg, @function
getAvg:
.LFB5:
	.loc 1 89 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	.loc 1 95 0
	movl	$0, -4(%rbp)
	jmp	.L20
.L25:
	.loc 1 96 0
	movl	$101, -8(%rbp)
	.loc 1 97 0
	movq	-40(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	-8(%rbp), %eax
	jge	.L21
	.loc 1 97 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -8(%rbp)
.L21:
	.loc 1 98 0 is_stmt 1
	movq	-40(%rbp), %rax
	leaq	400(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	cmpl	-8(%rbp), %eax
	jge	.L22
	.loc 1 98 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	leaq	400(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, -8(%rbp)
.L22:
	.loc 1 99 0 is_stmt 1
	movq	-40(%rbp), %rax
	leaq	800(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	cmpl	-8(%rbp), %eax
	jge	.L23
	.loc 1 99 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	leaq	800(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, -8(%rbp)
.L23:
	.loc 1 100 0 is_stmt 1
	movq	-40(%rbp), %rax
	leaq	1200(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	cmpl	-8(%rbp), %eax
	jge	.L24
	.loc 1 100 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	leaq	1200(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, -8(%rbp)
.L24:
	.loc 1 101 0 is_stmt 1 discriminator 2
	movq	-40(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %edx
	movq	-40(%rbp), %rax
	leaq	400(%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rcx,%rax,4), %eax
	leal	(%rdx,%rax), %ecx
	movq	-40(%rbp), %rax
	leaq	800(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	addl	%eax, %ecx
	movq	-40(%rbp), %rax
	leaq	1200(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	addl	%ecx, %eax
	subl	-8(%rbp), %eax
	movl	%eax, %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -12(%rbp)
	.loc 1 102 0 discriminator 2
	movq	-40(%rbp), %rax
	leaq	1600(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %edx
	movq	-40(%rbp), %rax
	leaq	2000(%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rcx,%rax,4), %eax
	leal	(%rdx,%rax), %ecx
	movq	-40(%rbp), %rax
	leaq	2400(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	addl	%eax, %ecx
	movq	-40(%rbp), %rax
	leaq	2800(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	leal	(%rcx,%rax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -16(%rbp)
	.loc 1 103 0 discriminator 2
	movq	-40(%rbp), %rax
	leaq	3200(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %edx
	movq	-40(%rbp), %rax
	leaq	3600(%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rcx,%rax,4), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
	.loc 1 104 0 discriminator 2
	movq	-40(%rbp), %rax
	leaq	4000(%rax), %rsi
	movl	-12(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	-16(%rbp), %eax
	addl	%eax, %edx
	movl	-20(%rbp), %eax
	addl	%eax, %eax
	leal	(%rdx,%rax), %ecx
	movl	$715827883, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, (%rsi,%rax,4)
	.loc 1 95 0 discriminator 2
	addl	$1, -4(%rbp)
.L20:
	.loc 1 95 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L25
	.loc 1 106 0 is_stmt 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	getAvg, .-getAvg
	.globl	getUserLine
	.type	getUserLine, @function
getUserLine:
.LFB6:
	.loc 1 110 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	.loc 1 113 0
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	gets
	testq	%rax, %rax
	je	.L27
	.loc 1 114 0
	movq	retBuffer(%rip), %rax
	movq	%rax, %rdx
	leaq	-256(%rbp), %rax
	movl	$256, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	leaq	8(%rdx), %rsi
	movl	%ecx, %edi
	addq	%rsi, %rdi
	leaq	8(%rax), %rsi
	movl	%ecx, %r8d
	addq	%r8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	.loc 1 115 0
	movq	retBuffer(%rip), %rax
	jmp	.L29
.L27:
	.loc 1 117 0
	movl	$0, %eax
.L29:
	.loc 1 118 0 discriminator 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	getUserLine, .-getUserLine
	.section	.rodata
.LC3:
	.string	"P4"
.LC4:
	.string	"P3"
.LC5:
	.string	"P2"
.LC6:
	.string	"P1"
.LC7:
	.string	"SID"
	.align 8
.LC8:
	.string	" %3s | %3s | %3s | %3s | %3s | %3s | %3s | %3s | %3s | %3s | %3s || %3s |\n"
.LC9:
	.string	"Avg"
.LC10:
	.string	"T2"
.LC11:
	.string	"T1"
.LC12:
	.string	"H4"
.LC13:
	.string	"H3"
.LC14:
	.string	"H2"
.LC15:
	.string	"H1"
	.align 8
.LC16:
	.string	"-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----||-----|"
.LC17:
	.string	"Me! %d %d\n"
	.align 8
.LC18:
	.string	" %3d | %3d | %3d | %3d | %3d | %3d | %3d | %3d | %3d | %3d | %3d || %3d |\n"
	.text
	.globl	printGrades
	.type	printGrades, @function
printGrades:
.LFB7:
	.loc 1 120 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	.loc 1 122 0
	subq	$8, %rsp
	pushq	$.LC9
	pushq	$.LC10
	pushq	$.LC11
	pushq	$.LC12
	pushq	$.LC13
	pushq	$.LC14
	pushq	$.LC15
	movl	$.LC3, %r9d
	movl	$.LC4, %r8d
	movl	$.LC5, %ecx
	movl	$.LC6, %edx
	movl	$.LC7, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	addq	$64, %rsp
	.loc 1 124 0
	movl	$.LC16, %edi
	call	puts
	.loc 1 125 0
	movl	$0, -36(%rbp)
	jmp	.L31
.L33:
	.loc 1 126 0
	movl	-64(%rbp), %edx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	cmpl	$236, %eax
	jne	.L32
	.loc 1 126 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %edx
	movl	-64(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC17, %edi
	movl	$0, %eax
	call	printf
.L32:
	.loc 1 130 0 is_stmt 1 discriminator 2
	movq	-56(%rbp), %rax
	leaq	4000(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %r11d
	.loc 1 130 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	3600(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %r10d
	.loc 1 130 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	3200(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %r9d
	.loc 1 129 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	2800(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %r8d
	.loc 1 129 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	2400(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %edi
	.loc 1 129 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	2000(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %esi
	.loc 1 129 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	1600(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %ecx
	.loc 1 128 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	1200(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %r13d
	.loc 1 128 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	800(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %r12d
	.loc 1 128 0 discriminator 2
	movq	-56(%rbp), %rax
	leaq	400(%rax), %rdx
	.loc 1 127 0 discriminator 2
	movl	-36(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %edx
	movq	-56(%rbp), %rax
	movl	-36(%rbp), %ebx
	movslq	%ebx, %rbx
	movl	(%rax,%rbx,4), %eax
	movl	-64(%rbp), %r14d
	movl	-36(%rbp), %ebx
	addl	%r14d, %ebx
	subq	$8, %rsp
	pushq	%r11
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	movl	%r13d, %r9d
	movl	%r12d, %r8d
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	%ebx, %esi
	movl	$.LC18, %edi
	movl	$0, %eax
	call	printf
	addq	$64, %rsp
	.loc 1 125 0 discriminator 2
	addl	$1, -36(%rbp)
.L31:
	.loc 1 125 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L33
	.loc 1 132 0 is_stmt 1
	movl	$.LC16, %edi
	call	puts
	.loc 1 133 0
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	printGrades, .-printGrades
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/4.9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/time.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/libio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/confname.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb3a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF290
	.byte	0x1
	.long	.LASF291
	.long	.LASF292
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd4
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x8b
	.long	0x69
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xa0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF13
	.uleb128 0x2
	.long	.LASF14
	.byte	0x4
	.byte	0x4b
	.long	0x8d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.long	.LASF16
	.byte	0x5
	.byte	0x30
	.long	0xcb
	.uleb128 0x7
	.long	.LASF46
	.byte	0xd8
	.byte	0x6
	.byte	0xf5
	.long	0x24b
	.uleb128 0x8
	.long	.LASF17
	.byte	0x6
	.byte	0xf6
	.long	0x3f
	.byte	0
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.byte	0xfb
	.long	0x9a
	.byte	0x8
	.uleb128 0x8
	.long	.LASF19
	.byte	0x6
	.byte	0xfc
	.long	0x9a
	.byte	0x10
	.uleb128 0x8
	.long	.LASF20
	.byte	0x6
	.byte	0xfd
	.long	0x9a
	.byte	0x18
	.uleb128 0x8
	.long	.LASF21
	.byte	0x6
	.byte	0xfe
	.long	0x9a
	.byte	0x20
	.uleb128 0x8
	.long	.LASF22
	.byte	0x6
	.byte	0xff
	.long	0x9a
	.byte	0x28
	.uleb128 0x9
	.long	.LASF23
	.byte	0x6
	.value	0x100
	.long	0x9a
	.byte	0x30
	.uleb128 0x9
	.long	.LASF24
	.byte	0x6
	.value	0x101
	.long	0x9a
	.byte	0x38
	.uleb128 0x9
	.long	.LASF25
	.byte	0x6
	.value	0x102
	.long	0x9a
	.byte	0x40
	.uleb128 0x9
	.long	.LASF26
	.byte	0x6
	.value	0x104
	.long	0x9a
	.byte	0x48
	.uleb128 0x9
	.long	.LASF27
	.byte	0x6
	.value	0x105
	.long	0x9a
	.byte	0x50
	.uleb128 0x9
	.long	.LASF28
	.byte	0x6
	.value	0x106
	.long	0x9a
	.byte	0x58
	.uleb128 0x9
	.long	.LASF29
	.byte	0x6
	.value	0x108
	.long	0x283
	.byte	0x60
	.uleb128 0x9
	.long	.LASF30
	.byte	0x6
	.value	0x10a
	.long	0x289
	.byte	0x68
	.uleb128 0x9
	.long	.LASF31
	.byte	0x6
	.value	0x10c
	.long	0x3f
	.byte	0x70
	.uleb128 0x9
	.long	.LASF32
	.byte	0x6
	.value	0x110
	.long	0x3f
	.byte	0x74
	.uleb128 0x9
	.long	.LASF33
	.byte	0x6
	.value	0x112
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF34
	.byte	0x6
	.value	0x116
	.long	0x4d
	.byte	0x80
	.uleb128 0x9
	.long	.LASF35
	.byte	0x6
	.value	0x117
	.long	0x5b
	.byte	0x82
	.uleb128 0x9
	.long	.LASF36
	.byte	0x6
	.value	0x118
	.long	0x28f
	.byte	0x83
	.uleb128 0x9
	.long	.LASF37
	.byte	0x6
	.value	0x11c
	.long	0x29f
	.byte	0x88
	.uleb128 0x9
	.long	.LASF38
	.byte	0x6
	.value	0x125
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF39
	.byte	0x6
	.value	0x12e
	.long	0x98
	.byte	0x98
	.uleb128 0x9
	.long	.LASF40
	.byte	0x6
	.value	0x12f
	.long	0x98
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x6
	.value	0x130
	.long	0x98
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF42
	.byte	0x6
	.value	0x131
	.long	0x98
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF43
	.byte	0x6
	.value	0x132
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF44
	.byte	0x6
	.value	0x134
	.long	0x3f
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF45
	.byte	0x6
	.value	0x136
	.long	0x2a5
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF293
	.byte	0x6
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF47
	.byte	0x18
	.byte	0x6
	.byte	0xa0
	.long	0x283
	.uleb128 0x8
	.long	.LASF48
	.byte	0x6
	.byte	0xa1
	.long	0x283
	.byte	0
	.uleb128 0x8
	.long	.LASF49
	.byte	0x6
	.byte	0xa2
	.long	0x289
	.byte	0x8
	.uleb128 0x8
	.long	.LASF50
	.byte	0x6
	.byte	0xa6
	.long	0x3f
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x252
	.uleb128 0x6
	.byte	0x8
	.long	0xcb
	.uleb128 0xb
	.long	0xa0
	.long	0x29f
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x24b
	.uleb128 0xb
	.long	0xa0
	.long	0x2b5
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.byte	0x7
	.byte	0x48
	.long	0x85e
	.uleb128 0xe
	.long	.LASF51
	.sleb128 0
	.uleb128 0xe
	.long	.LASF52
	.sleb128 1
	.uleb128 0xe
	.long	.LASF53
	.sleb128 2
	.uleb128 0xe
	.long	.LASF54
	.sleb128 3
	.uleb128 0xe
	.long	.LASF55
	.sleb128 4
	.uleb128 0xe
	.long	.LASF56
	.sleb128 5
	.uleb128 0xe
	.long	.LASF57
	.sleb128 6
	.uleb128 0xe
	.long	.LASF58
	.sleb128 7
	.uleb128 0xe
	.long	.LASF59
	.sleb128 8
	.uleb128 0xe
	.long	.LASF60
	.sleb128 9
	.uleb128 0xe
	.long	.LASF61
	.sleb128 10
	.uleb128 0xe
	.long	.LASF62
	.sleb128 11
	.uleb128 0xe
	.long	.LASF63
	.sleb128 12
	.uleb128 0xe
	.long	.LASF64
	.sleb128 13
	.uleb128 0xe
	.long	.LASF65
	.sleb128 14
	.uleb128 0xe
	.long	.LASF66
	.sleb128 15
	.uleb128 0xe
	.long	.LASF67
	.sleb128 16
	.uleb128 0xe
	.long	.LASF68
	.sleb128 17
	.uleb128 0xe
	.long	.LASF69
	.sleb128 18
	.uleb128 0xe
	.long	.LASF70
	.sleb128 19
	.uleb128 0xe
	.long	.LASF71
	.sleb128 20
	.uleb128 0xe
	.long	.LASF72
	.sleb128 21
	.uleb128 0xe
	.long	.LASF73
	.sleb128 22
	.uleb128 0xe
	.long	.LASF74
	.sleb128 23
	.uleb128 0xe
	.long	.LASF75
	.sleb128 24
	.uleb128 0xe
	.long	.LASF76
	.sleb128 25
	.uleb128 0xe
	.long	.LASF77
	.sleb128 26
	.uleb128 0xe
	.long	.LASF78
	.sleb128 27
	.uleb128 0xe
	.long	.LASF79
	.sleb128 28
	.uleb128 0xe
	.long	.LASF80
	.sleb128 29
	.uleb128 0xe
	.long	.LASF81
	.sleb128 30
	.uleb128 0xe
	.long	.LASF82
	.sleb128 31
	.uleb128 0xe
	.long	.LASF83
	.sleb128 32
	.uleb128 0xe
	.long	.LASF84
	.sleb128 33
	.uleb128 0xe
	.long	.LASF85
	.sleb128 34
	.uleb128 0xe
	.long	.LASF86
	.sleb128 35
	.uleb128 0xe
	.long	.LASF87
	.sleb128 36
	.uleb128 0xe
	.long	.LASF88
	.sleb128 37
	.uleb128 0xe
	.long	.LASF89
	.sleb128 38
	.uleb128 0xe
	.long	.LASF90
	.sleb128 39
	.uleb128 0xe
	.long	.LASF91
	.sleb128 40
	.uleb128 0xe
	.long	.LASF92
	.sleb128 41
	.uleb128 0xe
	.long	.LASF93
	.sleb128 42
	.uleb128 0xe
	.long	.LASF94
	.sleb128 43
	.uleb128 0xe
	.long	.LASF95
	.sleb128 44
	.uleb128 0xe
	.long	.LASF96
	.sleb128 45
	.uleb128 0xe
	.long	.LASF97
	.sleb128 46
	.uleb128 0xe
	.long	.LASF98
	.sleb128 47
	.uleb128 0xe
	.long	.LASF99
	.sleb128 48
	.uleb128 0xe
	.long	.LASF100
	.sleb128 49
	.uleb128 0xe
	.long	.LASF101
	.sleb128 50
	.uleb128 0xe
	.long	.LASF102
	.sleb128 51
	.uleb128 0xe
	.long	.LASF103
	.sleb128 52
	.uleb128 0xe
	.long	.LASF104
	.sleb128 53
	.uleb128 0xe
	.long	.LASF105
	.sleb128 54
	.uleb128 0xe
	.long	.LASF106
	.sleb128 55
	.uleb128 0xe
	.long	.LASF107
	.sleb128 56
	.uleb128 0xe
	.long	.LASF108
	.sleb128 57
	.uleb128 0xe
	.long	.LASF109
	.sleb128 58
	.uleb128 0xe
	.long	.LASF110
	.sleb128 59
	.uleb128 0xe
	.long	.LASF111
	.sleb128 60
	.uleb128 0xe
	.long	.LASF112
	.sleb128 60
	.uleb128 0xe
	.long	.LASF113
	.sleb128 61
	.uleb128 0xe
	.long	.LASF114
	.sleb128 62
	.uleb128 0xe
	.long	.LASF115
	.sleb128 63
	.uleb128 0xe
	.long	.LASF116
	.sleb128 64
	.uleb128 0xe
	.long	.LASF117
	.sleb128 65
	.uleb128 0xe
	.long	.LASF118
	.sleb128 66
	.uleb128 0xe
	.long	.LASF119
	.sleb128 67
	.uleb128 0xe
	.long	.LASF120
	.sleb128 68
	.uleb128 0xe
	.long	.LASF121
	.sleb128 69
	.uleb128 0xe
	.long	.LASF122
	.sleb128 70
	.uleb128 0xe
	.long	.LASF123
	.sleb128 71
	.uleb128 0xe
	.long	.LASF124
	.sleb128 72
	.uleb128 0xe
	.long	.LASF125
	.sleb128 73
	.uleb128 0xe
	.long	.LASF126
	.sleb128 74
	.uleb128 0xe
	.long	.LASF127
	.sleb128 75
	.uleb128 0xe
	.long	.LASF128
	.sleb128 76
	.uleb128 0xe
	.long	.LASF129
	.sleb128 77
	.uleb128 0xe
	.long	.LASF130
	.sleb128 78
	.uleb128 0xe
	.long	.LASF131
	.sleb128 79
	.uleb128 0xe
	.long	.LASF132
	.sleb128 80
	.uleb128 0xe
	.long	.LASF133
	.sleb128 81
	.uleb128 0xe
	.long	.LASF134
	.sleb128 82
	.uleb128 0xe
	.long	.LASF135
	.sleb128 83
	.uleb128 0xe
	.long	.LASF136
	.sleb128 84
	.uleb128 0xe
	.long	.LASF137
	.sleb128 85
	.uleb128 0xe
	.long	.LASF138
	.sleb128 86
	.uleb128 0xe
	.long	.LASF139
	.sleb128 87
	.uleb128 0xe
	.long	.LASF140
	.sleb128 88
	.uleb128 0xe
	.long	.LASF141
	.sleb128 89
	.uleb128 0xe
	.long	.LASF142
	.sleb128 90
	.uleb128 0xe
	.long	.LASF143
	.sleb128 91
	.uleb128 0xe
	.long	.LASF144
	.sleb128 92
	.uleb128 0xe
	.long	.LASF145
	.sleb128 93
	.uleb128 0xe
	.long	.LASF146
	.sleb128 94
	.uleb128 0xe
	.long	.LASF147
	.sleb128 95
	.uleb128 0xe
	.long	.LASF148
	.sleb128 96
	.uleb128 0xe
	.long	.LASF149
	.sleb128 97
	.uleb128 0xe
	.long	.LASF150
	.sleb128 98
	.uleb128 0xe
	.long	.LASF151
	.sleb128 99
	.uleb128 0xe
	.long	.LASF152
	.sleb128 100
	.uleb128 0xe
	.long	.LASF153
	.sleb128 101
	.uleb128 0xe
	.long	.LASF154
	.sleb128 102
	.uleb128 0xe
	.long	.LASF155
	.sleb128 103
	.uleb128 0xe
	.long	.LASF156
	.sleb128 104
	.uleb128 0xe
	.long	.LASF157
	.sleb128 105
	.uleb128 0xe
	.long	.LASF158
	.sleb128 106
	.uleb128 0xe
	.long	.LASF159
	.sleb128 107
	.uleb128 0xe
	.long	.LASF160
	.sleb128 108
	.uleb128 0xe
	.long	.LASF161
	.sleb128 109
	.uleb128 0xe
	.long	.LASF162
	.sleb128 110
	.uleb128 0xe
	.long	.LASF163
	.sleb128 111
	.uleb128 0xe
	.long	.LASF164
	.sleb128 112
	.uleb128 0xe
	.long	.LASF165
	.sleb128 113
	.uleb128 0xe
	.long	.LASF166
	.sleb128 114
	.uleb128 0xe
	.long	.LASF167
	.sleb128 115
	.uleb128 0xe
	.long	.LASF168
	.sleb128 116
	.uleb128 0xe
	.long	.LASF169
	.sleb128 117
	.uleb128 0xe
	.long	.LASF170
	.sleb128 118
	.uleb128 0xe
	.long	.LASF171
	.sleb128 119
	.uleb128 0xe
	.long	.LASF172
	.sleb128 120
	.uleb128 0xe
	.long	.LASF173
	.sleb128 121
	.uleb128 0xe
	.long	.LASF174
	.sleb128 122
	.uleb128 0xe
	.long	.LASF175
	.sleb128 123
	.uleb128 0xe
	.long	.LASF176
	.sleb128 124
	.uleb128 0xe
	.long	.LASF177
	.sleb128 125
	.uleb128 0xe
	.long	.LASF178
	.sleb128 126
	.uleb128 0xe
	.long	.LASF179
	.sleb128 127
	.uleb128 0xe
	.long	.LASF180
	.sleb128 128
	.uleb128 0xe
	.long	.LASF181
	.sleb128 129
	.uleb128 0xe
	.long	.LASF182
	.sleb128 130
	.uleb128 0xe
	.long	.LASF183
	.sleb128 131
	.uleb128 0xe
	.long	.LASF184
	.sleb128 132
	.uleb128 0xe
	.long	.LASF185
	.sleb128 133
	.uleb128 0xe
	.long	.LASF186
	.sleb128 134
	.uleb128 0xe
	.long	.LASF187
	.sleb128 135
	.uleb128 0xe
	.long	.LASF188
	.sleb128 136
	.uleb128 0xe
	.long	.LASF189
	.sleb128 137
	.uleb128 0xe
	.long	.LASF190
	.sleb128 138
	.uleb128 0xe
	.long	.LASF191
	.sleb128 139
	.uleb128 0xe
	.long	.LASF192
	.sleb128 140
	.uleb128 0xe
	.long	.LASF193
	.sleb128 141
	.uleb128 0xe
	.long	.LASF194
	.sleb128 142
	.uleb128 0xe
	.long	.LASF195
	.sleb128 143
	.uleb128 0xe
	.long	.LASF196
	.sleb128 144
	.uleb128 0xe
	.long	.LASF197
	.sleb128 145
	.uleb128 0xe
	.long	.LASF198
	.sleb128 146
	.uleb128 0xe
	.long	.LASF199
	.sleb128 147
	.uleb128 0xe
	.long	.LASF200
	.sleb128 148
	.uleb128 0xe
	.long	.LASF201
	.sleb128 149
	.uleb128 0xe
	.long	.LASF202
	.sleb128 150
	.uleb128 0xe
	.long	.LASF203
	.sleb128 151
	.uleb128 0xe
	.long	.LASF204
	.sleb128 152
	.uleb128 0xe
	.long	.LASF205
	.sleb128 153
	.uleb128 0xe
	.long	.LASF206
	.sleb128 154
	.uleb128 0xe
	.long	.LASF207
	.sleb128 155
	.uleb128 0xe
	.long	.LASF208
	.sleb128 156
	.uleb128 0xe
	.long	.LASF209
	.sleb128 157
	.uleb128 0xe
	.long	.LASF210
	.sleb128 158
	.uleb128 0xe
	.long	.LASF211
	.sleb128 159
	.uleb128 0xe
	.long	.LASF212
	.sleb128 160
	.uleb128 0xe
	.long	.LASF213
	.sleb128 161
	.uleb128 0xe
	.long	.LASF214
	.sleb128 162
	.uleb128 0xe
	.long	.LASF215
	.sleb128 163
	.uleb128 0xe
	.long	.LASF216
	.sleb128 164
	.uleb128 0xe
	.long	.LASF217
	.sleb128 165
	.uleb128 0xe
	.long	.LASF218
	.sleb128 166
	.uleb128 0xe
	.long	.LASF219
	.sleb128 167
	.uleb128 0xe
	.long	.LASF220
	.sleb128 168
	.uleb128 0xe
	.long	.LASF221
	.sleb128 169
	.uleb128 0xe
	.long	.LASF222
	.sleb128 170
	.uleb128 0xe
	.long	.LASF223
	.sleb128 171
	.uleb128 0xe
	.long	.LASF224
	.sleb128 172
	.uleb128 0xe
	.long	.LASF225
	.sleb128 173
	.uleb128 0xe
	.long	.LASF226
	.sleb128 174
	.uleb128 0xe
	.long	.LASF227
	.sleb128 175
	.uleb128 0xe
	.long	.LASF228
	.sleb128 176
	.uleb128 0xe
	.long	.LASF229
	.sleb128 177
	.uleb128 0xe
	.long	.LASF230
	.sleb128 178
	.uleb128 0xe
	.long	.LASF231
	.sleb128 179
	.uleb128 0xe
	.long	.LASF232
	.sleb128 180
	.uleb128 0xe
	.long	.LASF233
	.sleb128 181
	.uleb128 0xe
	.long	.LASF234
	.sleb128 182
	.uleb128 0xe
	.long	.LASF235
	.sleb128 183
	.uleb128 0xe
	.long	.LASF236
	.sleb128 184
	.uleb128 0xe
	.long	.LASF237
	.sleb128 185
	.uleb128 0xe
	.long	.LASF238
	.sleb128 186
	.uleb128 0xe
	.long	.LASF239
	.sleb128 187
	.uleb128 0xe
	.long	.LASF240
	.sleb128 188
	.uleb128 0xe
	.long	.LASF241
	.sleb128 189
	.uleb128 0xe
	.long	.LASF242
	.sleb128 190
	.uleb128 0xe
	.long	.LASF243
	.sleb128 191
	.uleb128 0xe
	.long	.LASF244
	.sleb128 192
	.uleb128 0xe
	.long	.LASF245
	.sleb128 193
	.uleb128 0xe
	.long	.LASF246
	.sleb128 194
	.uleb128 0xe
	.long	.LASF247
	.sleb128 195
	.uleb128 0xe
	.long	.LASF248
	.sleb128 196
	.uleb128 0xe
	.long	.LASF249
	.sleb128 197
	.uleb128 0xe
	.long	.LASF250
	.sleb128 198
	.uleb128 0xe
	.long	.LASF251
	.sleb128 199
	.uleb128 0xe
	.long	.LASF252
	.sleb128 235
	.uleb128 0xe
	.long	.LASF253
	.sleb128 236
	.uleb128 0xe
	.long	.LASF254
	.sleb128 237
	.uleb128 0xe
	.long	.LASF255
	.sleb128 238
	.uleb128 0xe
	.long	.LASF256
	.sleb128 239
	.uleb128 0xe
	.long	.LASF257
	.sleb128 240
	.uleb128 0xe
	.long	.LASF258
	.sleb128 241
	.uleb128 0xe
	.long	.LASF259
	.sleb128 242
	.uleb128 0xe
	.long	.LASF260
	.sleb128 243
	.uleb128 0xe
	.long	.LASF261
	.sleb128 244
	.uleb128 0xe
	.long	.LASF262
	.sleb128 245
	.uleb128 0xe
	.long	.LASF263
	.sleb128 246
	.uleb128 0xe
	.long	.LASF264
	.sleb128 247
	.uleb128 0xe
	.long	.LASF265
	.sleb128 248
	.byte	0
	.uleb128 0xf
	.long	.LASF294
	.byte	0x1
	.byte	0x18
	.long	0x3f
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x8e4
	.uleb128 0x10
	.long	.LASF266
	.byte	0x1
	.byte	0x18
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x10
	.long	.LASF267
	.byte	0x1
	.byte	0x18
	.long	0x8e4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x11
	.long	.LASF268
	.byte	0x1
	.byte	0x19
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.string	"t"
	.byte	0x1
	.byte	0x1a
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF269
	.byte	0x1
	.byte	0x1c
	.long	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x11
	.long	.LASF270
	.byte	0x1
	.byte	0x25
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9a
	.uleb128 0x14
	.long	.LASF273
	.byte	0x1
	.byte	0x3d
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x930
	.uleb128 0x10
	.long	.LASF271
	.byte	0x1
	.byte	0x3d
	.long	0x940
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0x3e
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.long	.LASF272
	.byte	0x1
	.byte	0x3f
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	0x3f
	.long	0x940
	.uleb128 0xc
	.long	0x86
	.byte	0x63
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x930
	.uleb128 0x15
	.long	.LASF274
	.byte	0x1
	.byte	0x49
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x98a
	.uleb128 0x10
	.long	.LASF271
	.byte	0x1
	.byte	0x49
	.long	0x940
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.byte	0x49
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x12
	.string	"s"
	.byte	0x1
	.byte	0x4a
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x14
	.long	.LASF275
	.byte	0x1
	.byte	0x59
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0xa06
	.uleb128 0x10
	.long	.LASF271
	.byte	0x1
	.byte	0x59
	.long	0x940
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.byte	0x59
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x12
	.string	"s"
	.byte	0x1
	.byte	0x5a
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.long	.LASF276
	.byte	0x1
	.byte	0x5b
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.long	.LASF277
	.byte	0x1
	.byte	0x5c
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.long	.LASF278
	.byte	0x1
	.byte	0x5d
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.long	.LASF279
	.byte	0x1
	.byte	0x5e
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x17
	.long	.LASF280
	.byte	0x1
	.byte	0x6e
	.long	0x9a
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0xa37
	.uleb128 0x11
	.long	.LASF281
	.byte	0x1
	.byte	0x6f
	.long	0xa37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.byte	0
	.uleb128 0xb
	.long	0xa0
	.long	0xa47
	.uleb128 0xc
	.long	0x86
	.byte	0xff
	.byte	0
	.uleb128 0x15
	.long	.LASF282
	.byte	0x1
	.byte	0x78
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xa9c
	.uleb128 0x10
	.long	.LASF271
	.byte	0x1
	.byte	0x78
	.long	0x940
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.byte	0x78
	.long	0x3f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x10
	.long	.LASF283
	.byte	0x1
	.byte	0x78
	.long	0x3f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x12
	.string	"s"
	.byte	0x1
	.byte	0x79
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x18
	.long	.LASF284
	.byte	0x5
	.byte	0xa9
	.long	0x289
	.uleb128 0xb
	.long	0x3f
	.long	0xabd
	.uleb128 0xc
	.long	0x86
	.byte	0xa
	.uleb128 0xc
	.long	0x86
	.byte	0x63
	.byte	0
	.uleb128 0x19
	.long	.LASF285
	.byte	0x1
	.byte	0x11
	.long	0xaa7
	.uleb128 0x9
	.byte	0x3
	.quad	aGrades
	.uleb128 0x19
	.long	.LASF286
	.byte	0x1
	.byte	0x12
	.long	0xaa7
	.uleb128 0x9
	.byte	0x3
	.quad	bGrades
	.uleb128 0xb
	.long	0xa0
	.long	0xaf8
	.uleb128 0x1a
	.long	0x86
	.value	0x13ff
	.byte	0
	.uleb128 0x19
	.long	.LASF287
	.byte	0x1
	.byte	0x13
	.long	0xae7
	.uleb128 0x9
	.byte	0x3
	.quad	retBufferArea
	.uleb128 0x19
	.long	.LASF288
	.byte	0x1
	.byte	0x14
	.long	0x9a
	.uleb128 0x9
	.byte	0x3
	.quad	retBuffer
	.uleb128 0x19
	.long	.LASF289
	.byte	0x1
	.byte	0x16
	.long	0xb37
	.uleb128 0x9
	.byte	0x3
	.quad	txtFile
	.uleb128 0x6
	.byte	0x8
	.long	0xc0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF133:
	.string	"_SC_THREAD_PRIO_PROTECT"
.LASF36:
	.string	"_shortbuf"
.LASF293:
	.string	"_IO_lock_t"
.LASF80:
	.string	"_SC_VERSION"
.LASF174:
	.string	"_SC_NL_NMAX"
.LASF25:
	.string	"_IO_buf_end"
.LASF65:
	.string	"_SC_SYNCHRONIZED_IO"
.LASF131:
	.string	"_SC_THREAD_PRIORITY_SCHEDULING"
.LASF136:
	.string	"_SC_NPROCESSORS_ONLN"
.LASF132:
	.string	"_SC_THREAD_PRIO_INHERIT"
.LASF70:
	.string	"_SC_MEMORY_PROTECTION"
.LASF216:
	.string	"_SC_TIMEOUTS"
.LASF186:
	.string	"_SC_BASE"
.LASF115:
	.string	"_SC_PII_OSI_COTS"
.LASF201:
	.string	"_SC_MONOTONIC_CLOCK"
.LASF120:
	.string	"_SC_THREAD_SAFE_FUNCTIONS"
.LASF292:
	.string	"/home/lribeir1/CS220/proj4"
.LASF23:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF112:
	.string	"_SC_IOV_MAX"
.LASF56:
	.string	"_SC_STREAM_MAX"
.LASF287:
	.string	"retBufferArea"
.LASF106:
	.string	"_SC_PII_SOCKET"
.LASF64:
	.string	"_SC_PRIORITIZED_IO"
.LASF266:
	.string	"argc"
.LASF17:
	.string	"_flags"
.LASF228:
	.string	"_SC_V6_ILP32_OFF32"
.LASF213:
	.string	"_SC_THREAD_SPORADIC_SERVER"
.LASF166:
	.string	"_SC_SHRT_MIN"
.LASF170:
	.string	"_SC_USHRT_MAX"
.LASF176:
	.string	"_SC_NL_TEXTMAX"
.LASF29:
	.string	"_markers"
.LASF291:
	.string	"gradesTemp.c"
.LASF125:
	.string	"_SC_THREAD_DESTRUCTOR_ITERATIONS"
.LASF197:
	.string	"_SC_PIPE"
.LASF88:
	.string	"_SC_BC_DIM_MAX"
.LASF67:
	.string	"_SC_MAPPED_FILES"
.LASF98:
	.string	"_SC_2_C_BIND"
.LASF78:
	.string	"_SC_MQ_OPEN_MAX"
.LASF146:
	.string	"_SC_XOPEN_SHM"
.LASF156:
	.string	"_SC_INT_MAX"
.LASF100:
	.string	"_SC_2_FORT_DEV"
.LASF150:
	.string	"_SC_XOPEN_XPG2"
.LASF151:
	.string	"_SC_XOPEN_XPG3"
.LASF152:
	.string	"_SC_XOPEN_XPG4"
.LASF107:
	.string	"_SC_PII_INTERNET"
.LASF256:
	.string	"_SC_V7_LP64_OFF64"
.LASF77:
	.string	"_SC_DELAYTIMER_MAX"
.LASF160:
	.string	"_SC_MB_LEN_MAX"
.LASF212:
	.string	"_SC_SPORADIC_SERVER"
.LASF139:
	.string	"_SC_ATEXIT_MAX"
.LASF60:
	.string	"_SC_REALTIME_SIGNALS"
.LASF194:
	.string	"_SC_DEVICE_SPECIFIC_R"
.LASF50:
	.string	"_pos"
.LASF134:
	.string	"_SC_THREAD_PROCESS_SHARED"
.LASF59:
	.string	"_SC_SAVED_IDS"
.LASF284:
	.string	"stdout"
.LASF188:
	.string	"_SC_C_LANG_SUPPORT_R"
.LASF28:
	.string	"_IO_save_end"
.LASF99:
	.string	"_SC_2_C_DEV"
.LASF180:
	.string	"_SC_XBS5_LPBIG_OFFBIG"
.LASF285:
	.string	"aGrades"
.LASF148:
	.string	"_SC_2_C_VERSION"
.LASF163:
	.string	"_SC_SCHAR_MAX"
.LASF162:
	.string	"_SC_SSIZE_MAX"
.LASF149:
	.string	"_SC_2_UPE"
.LASF270:
	.string	"seed"
.LASF252:
	.string	"_SC_IPV6"
.LASF87:
	.string	"_SC_BC_BASE_MAX"
.LASF15:
	.string	"long long unsigned int"
.LASF109:
	.string	"_SC_POLL"
.LASF182:
	.string	"_SC_XOPEN_REALTIME"
.LASF215:
	.string	"_SC_SYSTEM_DATABASE_R"
.LASF278:
	.string	"avgQuiz"
.LASF154:
	.string	"_SC_CHAR_MAX"
.LASF27:
	.string	"_IO_backup_base"
.LASF38:
	.string	"_offset"
.LASF238:
	.string	"_SC_LEVEL1_ICACHE_ASSOC"
.LASF205:
	.string	"_SC_READER_WRITER_LOCKS"
.LASF225:
	.string	"_SC_SYMLOOP_MAX"
.LASF236:
	.string	"_SC_TRACE_LOG"
.LASF31:
	.string	"_fileno"
.LASF288:
	.string	"retBuffer"
.LASF279:
	.string	"avgTest"
.LASF191:
	.string	"_SC_THREAD_CPUTIME"
.LASF261:
	.string	"_SC_TRACE_SYS_MAX"
.LASF178:
	.string	"_SC_XBS5_ILP32_OFFBIG"
.LASF114:
	.string	"_SC_PII_INTERNET_DGRAM"
.LASF7:
	.string	"size_t"
.LASF224:
	.string	"_SC_2_PBS_TRACK"
.LASF198:
	.string	"_SC_FILE_ATTRIBUTES"
.LASF63:
	.string	"_SC_ASYNCHRONOUS_IO"
.LASF66:
	.string	"_SC_FSYNC"
.LASF20:
	.string	"_IO_read_base"
.LASF241:
	.string	"_SC_LEVEL1_DCACHE_ASSOC"
.LASF193:
	.string	"_SC_DEVICE_SPECIFIC"
.LASF48:
	.string	"_next"
.LASF158:
	.string	"_SC_LONG_BIT"
.LASF83:
	.string	"_SC_SEM_NSEMS_MAX"
.LASF92:
	.string	"_SC_EQUIV_CLASS_MAX"
.LASF263:
	.string	"_SC_XOPEN_STREAMS"
.LASF239:
	.string	"_SC_LEVEL1_ICACHE_LINESIZE"
.LASF208:
	.string	"_SC_REGEX_VERSION"
.LASF221:
	.string	"_SC_2_PBS_ACCOUNTING"
.LASF267:
	.string	"argv"
.LASF75:
	.string	"_SC_AIO_MAX"
.LASF245:
	.string	"_SC_LEVEL2_CACHE_LINESIZE"
.LASF141:
	.string	"_SC_XOPEN_VERSION"
.LASF209:
	.string	"_SC_SHELL"
.LASF57:
	.string	"_SC_TZNAME_MAX"
.LASF12:
	.string	"char"
.LASF44:
	.string	"_mode"
.LASF69:
	.string	"_SC_MEMLOCK_RANGE"
.LASF138:
	.string	"_SC_AVPHYS_PAGES"
.LASF103:
	.string	"_SC_2_LOCALEDEF"
.LASF255:
	.string	"_SC_V7_ILP32_OFFBIG"
.LASF47:
	.string	"_IO_marker"
.LASF18:
	.string	"_IO_read_ptr"
.LASF257:
	.string	"_SC_V7_LPBIG_OFFBIG"
.LASF247:
	.string	"_SC_LEVEL3_CACHE_ASSOC"
.LASF200:
	.string	"_SC_FILE_SYSTEM"
.LASF14:
	.string	"time_t"
.LASF250:
	.string	"_SC_LEVEL4_CACHE_ASSOC"
.LASF229:
	.string	"_SC_V6_ILP32_OFFBIG"
.LASF85:
	.string	"_SC_SIGQUEUE_MAX"
.LASF211:
	.string	"_SC_SPAWN"
.LASF192:
	.string	"_SC_DEVICE_IO"
.LASF231:
	.string	"_SC_V6_LPBIG_OFFBIG"
.LASF97:
	.string	"_SC_2_VERSION"
.LASF249:
	.string	"_SC_LEVEL4_CACHE_SIZE"
.LASF269:
	.string	"pagesize"
.LASF21:
	.string	"_IO_write_base"
.LASF275:
	.string	"getAvg"
.LASF280:
	.string	"getUserLine"
.LASF226:
	.string	"_SC_STREAMS"
.LASF13:
	.string	"long long int"
.LASF219:
	.string	"_SC_USER_GROUPS_R"
.LASF26:
	.string	"_IO_save_base"
.LASF94:
	.string	"_SC_LINE_MAX"
.LASF190:
	.string	"_SC_CPUTIME"
.LASF111:
	.string	"_SC_UIO_MAXIOV"
.LASF232:
	.string	"_SC_HOST_NAME_MAX"
.LASF187:
	.string	"_SC_C_LANG_SUPPORT"
.LASF126:
	.string	"_SC_THREAD_KEYS_MAX"
.LASF127:
	.string	"_SC_THREAD_STACK_MIN"
.LASF72:
	.string	"_SC_SEMAPHORES"
.LASF168:
	.string	"_SC_UINT_MAX"
.LASF52:
	.string	"_SC_CHILD_MAX"
.LASF281:
	.string	"buffer"
.LASF118:
	.string	"_SC_T_IOV_MAX"
.LASF54:
	.string	"_SC_NGROUPS_MAX"
.LASF203:
	.string	"_SC_SINGLE_PROCESS"
.LASF144:
	.string	"_SC_XOPEN_CRYPT"
.LASF274:
	.string	"getGrades"
.LASF248:
	.string	"_SC_LEVEL3_CACHE_LINESIZE"
.LASF124:
	.string	"_SC_TTY_NAME_MAX"
.LASF39:
	.string	"__pad1"
.LASF40:
	.string	"__pad2"
.LASF41:
	.string	"__pad3"
.LASF42:
	.string	"__pad4"
.LASF43:
	.string	"__pad5"
.LASF289:
	.string	"txtFile"
.LASF105:
	.string	"_SC_PII_XTI"
.LASF153:
	.string	"_SC_CHAR_BIT"
.LASF240:
	.string	"_SC_LEVEL1_DCACHE_SIZE"
.LASF277:
	.string	"minProj"
.LASF35:
	.string	"_vtable_offset"
.LASF189:
	.string	"_SC_CLOCK_SELECTION"
.LASF68:
	.string	"_SC_MEMLOCK"
.LASF58:
	.string	"_SC_JOB_CONTROL"
.LASF53:
	.string	"_SC_CLK_TCK"
.LASF184:
	.string	"_SC_ADVISORY_INFO"
.LASF62:
	.string	"_SC_TIMERS"
.LASF185:
	.string	"_SC_BARRIERS"
.LASF89:
	.string	"_SC_BC_SCALE_MAX"
.LASF169:
	.string	"_SC_ULONG_MAX"
.LASF79:
	.string	"_SC_MQ_PRIO_MAX"
.LASF233:
	.string	"_SC_TRACE"
.LASF246:
	.string	"_SC_LEVEL3_CACHE_SIZE"
.LASF206:
	.string	"_SC_SPIN_LOCKS"
.LASF242:
	.string	"_SC_LEVEL1_DCACHE_LINESIZE"
.LASF90:
	.string	"_SC_BC_STRING_MAX"
.LASF135:
	.string	"_SC_NPROCESSORS_CONF"
.LASF157:
	.string	"_SC_INT_MIN"
.LASF254:
	.string	"_SC_V7_ILP32_OFF32"
.LASF19:
	.string	"_IO_read_end"
.LASF195:
	.string	"_SC_FD_MGMT"
.LASF207:
	.string	"_SC_REGEXP"
.LASF5:
	.string	"short int"
.LASF237:
	.string	"_SC_LEVEL1_ICACHE_SIZE"
.LASF95:
	.string	"_SC_RE_DUP_MAX"
.LASF81:
	.string	"_SC_PAGESIZE"
.LASF6:
	.string	"long int"
.LASF165:
	.string	"_SC_SHRT_MAX"
.LASF179:
	.string	"_SC_XBS5_LP64_OFF64"
.LASF214:
	.string	"_SC_SYSTEM_DATABASE"
.LASF183:
	.string	"_SC_XOPEN_REALTIME_THREADS"
.LASF265:
	.string	"_SC_THREAD_ROBUST_PRIO_PROTECT"
.LASF147:
	.string	"_SC_2_CHAR_TERM"
.LASF140:
	.string	"_SC_PASS_MAX"
.LASF196:
	.string	"_SC_FIFO"
.LASF51:
	.string	"_SC_ARG_MAX"
.LASF243:
	.string	"_SC_LEVEL2_CACHE_SIZE"
.LASF227:
	.string	"_SC_2_PBS_CHECKPOINT"
.LASF268:
	.string	"secID"
.LASF101:
	.string	"_SC_2_FORT_RUN"
.LASF234:
	.string	"_SC_TRACE_EVENT_FILTER"
.LASF84:
	.string	"_SC_SEM_VALUE_MAX"
.LASF130:
	.string	"_SC_THREAD_ATTR_STACKSIZE"
.LASF74:
	.string	"_SC_AIO_LISTIO_MAX"
.LASF264:
	.string	"_SC_THREAD_ROBUST_PRIO_INHERIT"
.LASF119:
	.string	"_SC_THREADS"
.LASF290:
	.string	"GNU C 4.9.2 -mtune=generic -march=x86-64 -g"
.LASF104:
	.string	"_SC_PII"
.LASF235:
	.string	"_SC_TRACE_INHERIT"
.LASF159:
	.string	"_SC_WORD_BIT"
.LASF177:
	.string	"_SC_XBS5_ILP32_OFF32"
.LASF117:
	.string	"_SC_PII_OSI_M"
.LASF272:
	.string	"eleven"
.LASF102:
	.string	"_SC_2_SW_DEV"
.LASF282:
	.string	"printGrades"
.LASF37:
	.string	"_lock"
.LASF155:
	.string	"_SC_CHAR_MIN"
.LASF286:
	.string	"bGrades"
.LASF10:
	.string	"sizetype"
.LASF143:
	.string	"_SC_XOPEN_UNIX"
.LASF0:
	.string	"long unsigned int"
.LASF33:
	.string	"_old_offset"
.LASF108:
	.string	"_SC_PII_OSI"
.LASF46:
	.string	"_IO_FILE"
.LASF167:
	.string	"_SC_UCHAR_MAX"
.LASF164:
	.string	"_SC_SCHAR_MIN"
.LASF61:
	.string	"_SC_PRIORITY_SCHEDULING"
.LASF110:
	.string	"_SC_SELECT"
.LASF204:
	.string	"_SC_NETWORKING"
.LASF86:
	.string	"_SC_TIMER_MAX"
.LASF259:
	.string	"_SC_TRACE_EVENT_NAME_MAX"
.LASF230:
	.string	"_SC_V6_LP64_OFF64"
.LASF121:
	.string	"_SC_GETGR_R_SIZE_MAX"
.LASF1:
	.string	"unsigned char"
.LASF123:
	.string	"_SC_LOGIN_NAME_MAX"
.LASF93:
	.string	"_SC_EXPR_NEST_MAX"
.LASF49:
	.string	"_sbuf"
.LASF113:
	.string	"_SC_PII_INTERNET_STREAM"
.LASF22:
	.string	"_IO_write_ptr"
.LASF258:
	.string	"_SC_SS_REPL_MAX"
.LASF253:
	.string	"_SC_RAW_SOCKETS"
.LASF283:
	.string	"first"
.LASF251:
	.string	"_SC_LEVEL4_CACHE_LINESIZE"
.LASF210:
	.string	"_SC_SIGNALS"
.LASF71:
	.string	"_SC_MESSAGE_PASSING"
.LASF11:
	.string	"__time_t"
.LASF276:
	.string	"avgProj"
.LASF73:
	.string	"_SC_SHARED_MEMORY_OBJECTS"
.LASF96:
	.string	"_SC_CHARCLASS_NAME_MAX"
.LASF116:
	.string	"_SC_PII_OSI_CLTS"
.LASF271:
	.string	"grds"
.LASF217:
	.string	"_SC_TYPED_MEMORY_OBJECTS"
.LASF220:
	.string	"_SC_2_PBS"
.LASF137:
	.string	"_SC_PHYS_PAGES"
.LASF8:
	.string	"__off_t"
.LASF202:
	.string	"_SC_MULTI_PROCESS"
.LASF244:
	.string	"_SC_LEVEL2_CACHE_ASSOC"
.LASF4:
	.string	"signed char"
.LASF55:
	.string	"_SC_OPEN_MAX"
.LASF2:
	.string	"short unsigned int"
.LASF128:
	.string	"_SC_THREAD_THREADS_MAX"
.LASF294:
	.string	"main"
.LASF161:
	.string	"_SC_NZERO"
.LASF122:
	.string	"_SC_GETPW_R_SIZE_MAX"
.LASF223:
	.string	"_SC_2_PBS_MESSAGE"
.LASF82:
	.string	"_SC_RTSIG_MAX"
.LASF129:
	.string	"_SC_THREAD_ATTR_STACKADDR"
.LASF199:
	.string	"_SC_FILE_LOCKING"
.LASF260:
	.string	"_SC_TRACE_NAME_MAX"
.LASF91:
	.string	"_SC_COLL_WEIGHTS_MAX"
.LASF145:
	.string	"_SC_XOPEN_ENH_I18N"
.LASF181:
	.string	"_SC_XOPEN_LEGACY"
.LASF30:
	.string	"_chain"
.LASF173:
	.string	"_SC_NL_MSGMAX"
.LASF172:
	.string	"_SC_NL_LANGMAX"
.LASF16:
	.string	"FILE"
.LASF32:
	.string	"_flags2"
.LASF218:
	.string	"_SC_USER_GROUPS"
.LASF273:
	.string	"changeGrade"
.LASF222:
	.string	"_SC_2_PBS_LOCATE"
.LASF175:
	.string	"_SC_NL_SETMAX"
.LASF34:
	.string	"_cur_column"
.LASF171:
	.string	"_SC_NL_ARGMAX"
.LASF262:
	.string	"_SC_TRACE_USER_EVENT_MAX"
.LASF9:
	.string	"__off64_t"
.LASF45:
	.string	"_unused2"
.LASF24:
	.string	"_IO_buf_base"
.LASF76:
	.string	"_SC_AIO_PRIO_DELTA_MAX"
.LASF142:
	.string	"_SC_XOPEN_XCU_VERSION"
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
