	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_print_hello_world
	.p2align	4, 0x90
_print_hello_world:                     ## @print_hello_world
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -4(%rbp)          ## 4-byte Spill
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_print_arg_count
	.p2align	4, 0x90
_print_arg_count:                       ## @print_arg_count
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi3:
	.cfi_def_cfa_offset 16
Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi5:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi6:
	.cfi_def_cfa_offset 16
Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	callq	_print_hello_world
	movl	-8(%rbp), %edi
	callq	_print_arg_count
	leaq	L_.str.1(%rip), %rdi
	movl	%eax, %esi
	movb	$0, %al
	callq	_printf
	cmpl	$1, -8(%rbp)
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	jle	LBB2_6
## BB#1:
	movl	$0, -20(%rbp)
LBB2_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	LBB2_5
## BB#3:                                ##   in Loop: Header=BB2_2 Depth=1
	leaq	L_.str.2(%rip), %rdi
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdx
	movb	$0, %al
	callq	_printf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
## BB#4:                                ##   in Loop: Header=BB2_2 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB2_2
LBB2_5:
	jmp	LBB2_6
LBB2_6:
	leaq	L_.str.3(%rip), %rdi
	movq	-16(%rbp), %rax
	movq	800(%rax), %rsi
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Hello world!\n"

L_.str.1:                               ## @.str.1
	.asciz	"Arg count is: %d \n"

L_.str.2:                               ## @.str.2
	.asciz	"argv[%d]: %s\n"

L_.str.3:                               ## @.str.3
	.asciz	"%s"


.subsections_via_symbols
