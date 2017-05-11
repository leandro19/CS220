	.file	"hack.c"
	.text
	.globl	changeGrade
	.type	changeGrade, @function
changeGrade:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq 	$0x602bc0,%rdi
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L6:
	cmpl	$3, -4(%rbp)
	jle	.L3
	cmpl	$7, -4(%rbp)
	jle	.L4
.L3:
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
	jmp	.L5
.L4:
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
	movl	$11, 144(%rax)
	subl	$1, 144(%rax)
.L5:
	addl	$1, -4(%rbp)
.L2:
	cmpl	$11, -4(%rbp)
	jl	.L6
	movq 	$0x602000,%rax
	movq 	$0x42,(%rax)
	movq    %rsp,%rbp
	addq    $0x38,%rbp
	addq    $0x8,%rsp
	pushq  $0x400973
	subq    $0x30,%rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	changeGrade, .-changeGrade
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
