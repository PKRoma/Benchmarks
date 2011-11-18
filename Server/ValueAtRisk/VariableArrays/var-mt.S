	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z11initialSeedm
	.align	4, 0x90
__Z11initialSeedm:
Leh_func_begin1:
	pushq	%rbp
Ltmp0:
	movq	%rsp, %rbp
Ltmp1:
	movl	$1, %eax
	movl	$300773, %ecx
	movl	$1, %edx
	movl	$64, %esi
	.align	4, 0x90
LBB1_1:
	testq	%rdi, %rdx
	je	LBB1_3
	imull	%ecx, %eax
	andl	$1073741823, %eax
LBB1_3:
	addq	%rdx, %rdx
	imull	%ecx, %ecx
	andl	$1073741823, %ecx
	decl	%esi
	jne	LBB1_1
	popq	%rbp
	ret
Leh_func_end1:

	.globl	__Z13doubleComparePKvS0_
	.align	4, 0x90
__Z13doubleComparePKvS0_:
Leh_func_begin2:
	pushq	%rbp
Ltmp2:
	movq	%rsp, %rbp
Ltmp3:
	movsd	(%rdi), %xmm0
	movsd	(%rsi), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	LBB2_2
	ucomisd	%xmm1, %xmm0
	seta	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
LBB2_2:
	movl	$-1, %eax
	popq	%rbp
	ret
Leh_func_end2:

	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.globl	__ZSt26__uninitialized_fill_n_auxIPSt6vectorIdSaIdEEmS2_EvT_T0_RKT1_St12__false_type
.weak_definition __ZSt26__uninitialized_fill_n_auxIPSt6vectorIdSaIdEEmS2_EvT_T0_RKT1_St12__false_type
	.align	4, 0x90
__ZSt26__uninitialized_fill_n_auxIPSt6vectorIdSaIdEEmS2_EvT_T0_RKT1_St12__false_type:
Leh_func_begin3:
	pushq	%rbp
Ltmp22:
	movq	%rsp, %rbp
Ltmp23:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
Ltmp24:
	xorl	%ebx, %ebx
	movq	%rdx, -48(%rbp)
	movq	%rsi, -56(%rbp)
	movq	%rdi, %r14
	movq	%rbx, %r15
	jmp	LBB3_14
	.align	4, 0x90
LBB3_1:
	leaq	(%r14,%rbx), %rax
	testq	%rax, %rax
	je	LBB3_13
	movq	-48(%rbp), %rdx
	movq	8(%rdx), %rdi
	subq	(%rdx), %rdi
	movq	$0, (%r14,%rbx)
	movq	$0, 8(%r14,%rbx)
	movq	$0, 16(%r14,%rbx)
	movq	%rdi, %r12
	sarq	$3, %r12
	testq	%r12, %r12
	jne	LBB3_4
	xorl	%r12d, %r12d
	jmp	LBB3_11
LBB3_4:
	movabsq	$2305843009213693952, %rax
	cmpq	%rax, %r12
	jb	LBB3_6
Ltmp4:
	callq	__ZSt17__throw_bad_allocv
Ltmp5:
LBB3_6:
Ltmp6:
	andq	$-8, %rdi
	callq	__Znwm
Ltmp7:
	movq	%rax, (%r14,%rbx)
	movq	%rax, 8(%r14,%rbx)
	leaq	(%rax,%r12,8), %r12
	movq	%r12, 16(%r14,%rbx)
	movq	%rax, %r12
	jmp	LBB3_11
LBB3_8:
Ltmp8:
	jmp	LBB3_10
LBB3_9:
Ltmp9:
LBB3_10:
	movq	%rax, %rdi
Ltmp10:
	callq	__Unwind_Resume_or_Rethrow
Ltmp11:
LBB3_11:
	movq	-48(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	8(%rdx), %r13
	subq	%rsi, %r13
	movq	%r12, %rdi
	movq	%r13, %rdx
	callq	_memmove
	andq	$-8, %r13
	addq	%r12, %r13
	movq	%r13, 8(%r14,%rbx)
	jmp	LBB3_13
LBB3_12:
Ltmp12:
Ltmp13:
	movq	%rax, %rdi
	callq	__Unwind_Resume_or_Rethrow
Ltmp14:
LBB3_13:
	addq	$24, %rbx
	incq	%r15
LBB3_14:
	cmpq	%r15, -56(%rbp)
	jne	LBB3_1
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB3_16:
Ltmp15:
	callq	___cxa_rethrow
Ltmp16:
LBB3_17:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
LBB3_18:
Ltmp17:
	movq	%rax, %rdi
	callq	___cxa_begin_catch
	testq	%rbx, %rbx
	je	LBB3_16
	.align	4, 0x90
LBB3_19:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB3_21
	callq	__ZdlPv
LBB3_21:
	addq	$24, %r14
	decq	%r15
	je	LBB3_16
	jmp	LBB3_19
LBB3_22:
Ltmp18:
	movq	%rax, %rbx
Ltmp19:
	callq	___cxa_end_catch
Ltmp20:
	jmp	LBB3_17
LBB3_23:
Ltmp21:
	callq	__ZSt9terminatev
Leh_func_end3:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table3:
Lexception3:
	.byte	255
	.byte	155
	.byte	242
	.space	2,128
	.space	1
	.byte	3
	.byte	104
Lset0 = Ltmp4-Leh_func_begin3
	.long	Lset0
Lset1 = Ltmp5-Ltmp4
	.long	Lset1
Lset2 = Ltmp9-Leh_func_begin3
	.long	Lset2
	.byte	3
Lset3 = Ltmp6-Leh_func_begin3
	.long	Lset3
Lset4 = Ltmp7-Ltmp6
	.long	Lset4
Lset5 = Ltmp8-Leh_func_begin3
	.long	Lset5
	.byte	3
Lset6 = Ltmp10-Leh_func_begin3
	.long	Lset6
Lset7 = Ltmp11-Ltmp10
	.long	Lset7
Lset8 = Ltmp12-Leh_func_begin3
	.long	Lset8
	.byte	3
Lset9 = Ltmp11-Leh_func_begin3
	.long	Lset9
Lset10 = Ltmp13-Ltmp11
	.long	Lset10
	.long	0
	.byte	0
Lset11 = Ltmp13-Leh_func_begin3
	.long	Lset11
Lset12 = Ltmp14-Ltmp13
	.long	Lset12
Lset13 = Ltmp17-Leh_func_begin3
	.long	Lset13
	.byte	3
Lset14 = Ltmp15-Leh_func_begin3
	.long	Lset14
Lset15 = Ltmp16-Ltmp15
	.long	Lset15
Lset16 = Ltmp18-Leh_func_begin3
	.long	Lset16
	.byte	0
Lset17 = Ltmp16-Leh_func_begin3
	.long	Lset17
Lset18 = Ltmp19-Ltmp16
	.long	Lset18
	.long	0
	.byte	0
Lset19 = Ltmp19-Leh_func_begin3
	.long	Lset19
Lset20 = Ltmp20-Ltmp19
	.long	Lset20
Lset21 = Ltmp21-Leh_func_begin3
	.long	Lset21
	.byte	1


	.byte	127
	.byte	0

	.byte	1
	.byte	0

	.long	0

	.byte	0
	.align	2

	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.globl	__ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type
.weak_definition __ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type
	.align	4, 0x90
__ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type:
Leh_func_begin4:
	pushq	%rbp
Ltmp43:
	movq	%rsp, %rbp
Ltmp44:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
Ltmp45:
	subq	%rdi, %rsi
	movq	%rsi, -56(%rbp)
	xorl	%ebx, %ebx
	movq	%rdx, %r14
	movq	%rdi, -48(%rbp)
	movq	%rbx, %r15
	jmp	LBB4_14
	.align	4, 0x90
LBB4_1:
	testq	%rax, %rax
	je	LBB4_13
	movq	-48(%rbp), %rax
	movq	8(%rax,%rbx), %rdi
	subq	(%rax,%rbx), %rdi
	movq	$0, (%r14,%rbx)
	movq	$0, 8(%r14,%rbx)
	movq	$0, 16(%r14,%rbx)
	movq	%rdi, %r12
	sarq	$3, %r12
	testq	%r12, %r12
	jne	LBB4_4
	xorl	%r12d, %r12d
	jmp	LBB4_11
LBB4_4:
	movabsq	$2305843009213693952, %rax
	cmpq	%rax, %r12
	jb	LBB4_6
Ltmp25:
	callq	__ZSt17__throw_bad_allocv
Ltmp26:
LBB4_6:
Ltmp27:
	andq	$-8, %rdi
	callq	__Znwm
Ltmp28:
	movq	%rax, (%r14,%rbx)
	movq	%rax, 8(%r14,%rbx)
	leaq	(%rax,%r12,8), %r12
	movq	%r12, 16(%r14,%rbx)
	movq	%rax, %r12
	jmp	LBB4_11
LBB4_8:
Ltmp29:
	jmp	LBB4_10
LBB4_9:
Ltmp30:
LBB4_10:
	movq	%rax, %rdi
Ltmp31:
	callq	__Unwind_Resume_or_Rethrow
Ltmp32:
LBB4_11:
	movq	-48(%rbp), %rdi
	movq	(%rdi,%rbx), %rsi
	movq	8(%rdi,%rbx), %r13
	subq	%rsi, %r13
	movq	%r12, %rdi
	movq	%r13, %rdx
	callq	_memmove
	andq	$-8, %r13
	addq	%r12, %r13
	movq	%r13, 8(%r14,%rbx)
	jmp	LBB4_13
LBB4_12:
Ltmp33:
Ltmp34:
	movq	%rax, %rdi
	callq	__Unwind_Resume_or_Rethrow
Ltmp35:
LBB4_13:
	addq	$24, %rbx
	incq	%r15
LBB4_14:
	leaq	(%r14,%rbx), %rax
	cmpq	%rbx, -56(%rbp)
	jne	LBB4_1
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB4_16:
Ltmp36:
	callq	___cxa_rethrow
Ltmp37:
LBB4_17:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
LBB4_18:
Ltmp38:
	movq	%rax, %rdi
	callq	___cxa_begin_catch
	testq	%rbx, %rbx
	je	LBB4_16
	.align	4, 0x90
LBB4_19:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB4_21
	callq	__ZdlPv
LBB4_21:
	addq	$24, %r14
	decq	%r15
	je	LBB4_16
	jmp	LBB4_19
LBB4_22:
Ltmp39:
	movq	%rax, %rbx
Ltmp40:
	callq	___cxa_end_catch
Ltmp41:
	jmp	LBB4_17
LBB4_23:
Ltmp42:
	callq	__ZSt9terminatev
Leh_func_end4:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table4:
Lexception4:
	.byte	255
	.byte	155
	.byte	242
	.space	2,128
	.space	1
	.byte	3
	.byte	104
Lset22 = Ltmp25-Leh_func_begin4
	.long	Lset22
Lset23 = Ltmp26-Ltmp25
	.long	Lset23
Lset24 = Ltmp30-Leh_func_begin4
	.long	Lset24
	.byte	3
Lset25 = Ltmp27-Leh_func_begin4
	.long	Lset25
Lset26 = Ltmp28-Ltmp27
	.long	Lset26
Lset27 = Ltmp29-Leh_func_begin4
	.long	Lset27
	.byte	3
Lset28 = Ltmp31-Leh_func_begin4
	.long	Lset28
Lset29 = Ltmp32-Ltmp31
	.long	Lset29
Lset30 = Ltmp33-Leh_func_begin4
	.long	Lset30
	.byte	3
Lset31 = Ltmp32-Leh_func_begin4
	.long	Lset31
Lset32 = Ltmp34-Ltmp32
	.long	Lset32
	.long	0
	.byte	0
Lset33 = Ltmp34-Leh_func_begin4
	.long	Lset33
Lset34 = Ltmp35-Ltmp34
	.long	Lset34
Lset35 = Ltmp38-Leh_func_begin4
	.long	Lset35
	.byte	3
Lset36 = Ltmp36-Leh_func_begin4
	.long	Lset36
Lset37 = Ltmp37-Ltmp36
	.long	Lset37
Lset38 = Ltmp39-Leh_func_begin4
	.long	Lset38
	.byte	0
Lset39 = Ltmp37-Leh_func_begin4
	.long	Lset39
Lset40 = Ltmp40-Ltmp37
	.long	Lset40
	.long	0
	.byte	0
Lset41 = Ltmp40-Leh_func_begin4
	.long	Lset41
Lset42 = Ltmp41-Ltmp40
	.long	Lset42
Lset43 = Ltmp42-Leh_func_begin4
	.long	Lset43
	.byte	1


	.byte	127
	.byte	0

	.byte	1
	.byte	0

	.long	0

	.byte	0
	.align	2

	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.globl	__ZNSt6vectorIdSaIdEEaSERKS1_
.weak_definition __ZNSt6vectorIdSaIdEEaSERKS1_
	.align	1, 0x90
__ZNSt6vectorIdSaIdEEaSERKS1_:
Leh_func_begin5:
	pushq	%rbp
Ltmp46:
	movq	%rsp, %rbp
Ltmp47:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
Ltmp48:
	cmpq	%rdi, %rsi
	movq	%rdi, %rbx
	je	LBB5_11
	movq	%rsi, %r14
	movq	(%r14), %r15
	movq	8(%r14), %r12
	subq	%r15, %r12
	movq	%r12, %r13
	sarq	$3, %r13
	movq	(%rbx), %rdi
	movq	16(%rbx), %rax
	subq	%rdi, %rax
	sarq	$3, %rax
	cmpq	%r13, %rax
	jae	LBB5_6
	movabsq	$2305843009213693952, %r14
	cmpq	%r14, %r13
	jae	LBB5_12
	movq	%r12, %rdi
	andq	$-8, %rdi
	callq	__Znwm
	movq	%rax, %r14
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	callq	_memmove
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB5_5
	callq	__ZdlPv
LBB5_5:
	movq	%r14, (%rbx)
	leaq	(%r14,%r13,8), %r14
	movq	%r14, 16(%rbx)
	jmp	LBB5_10
LBB5_6:
	movq	8(%rbx), %rdx
	subq	%rdi, %rdx
	movq	%rdx, %rax
	sarq	$3, %rax
	cmpq	%r13, %rax
	jb	LBB5_8
	movq	%r15, %rsi
	movq	%r12, %rdx
	jmp	LBB5_9
LBB5_8:
	andq	$-8, %rdx
	movq	%r15, %rsi
	callq	_memmove
	movq	8(%rbx), %rdi
	movq	%rdi, %rax
	subq	(%rbx), %rax
	andq	$-8, %rax
	movq	(%r14), %rsi
	movq	8(%r14), %rdx
	addq	%rax, %rsi
	subq	%rsi, %rdx
LBB5_9:
	callq	_memmove
LBB5_10:
	shlq	$3, %r13
	addq	(%rbx), %r13
	movq	%r13, 8(%rbx)
LBB5_11:
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB5_12:
	callq	__ZSt17__throw_bad_allocv
Leh_func_end5:

	.globl	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
.weak_definition __ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
	.align	1, 0x90
__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd:
Leh_func_begin6:
	pushq	%rbp
Ltmp49:
	movq	%rsp, %rbp
Ltmp50:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
Ltmp51:
	movq	%rcx, -48(%rbp)
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, -56(%rbp)
	testq	%rbx, %rbx
	je	LBB6_6
	movq	8(%rdi), %r15
	movq	16(%rdi), %rax
	subq	%r15, %rax
	sarq	$3, %rax
	cmpq	%rbx, %rax
	jb	LBB6_15
	movq	%r15, %rdx
	subq	%r14, %rdx
	movq	%rdx, %r12
	sarq	$3, %r12
	cmpq	%rbx, %r12
	movq	-48(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -48(%rbp)
	jbe	LBB6_7
	leaq	(,%rbx,8), %r12
	movq	%r15, %r13
	subq	%r12, %r13
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	callq	_memmove
	movq	-56(%rbp), %rdi
	addq	%r12, 8(%rdi)
	subq	%r14, %r13
	movq	%r13, %rdx
	andq	$-8, %rdx
	movq	%r15, %rdi
	subq	%rdx, %rdi
	movq	%r14, %rsi
	callq	_memmove
	testq	%r12, %r12
	je	LBB6_6
	movsd	-48(%rbp), %xmm0
	.align	4, 0x90
LBB6_5:
	movsd	%xmm0, (%r14)
	addq	$8, %r14
	decq	%rbx
	jne	LBB6_5
LBB6_6:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB6_7:
	cmpq	%rbx, %r12
	jne	LBB6_9
	movq	%r15, %rax
	jmp	LBB6_12
LBB6_9:
	movq	%rbx, %rax
	subq	%r12, %rax
	movq	%r15, %rcx
	movsd	-48(%rbp), %xmm0
	.align	4, 0x90
LBB6_10:
	movsd	%xmm0, (%rcx)
	addq	$8, %rcx
	decq	%rax
	jne	LBB6_10
	movq	-56(%rbp), %rdi
	movq	8(%rdi), %rax
LBB6_12:
	subq	%r12, %rbx
	leaq	(%rax,%rbx,8), %rdi
	movq	-56(%rbp), %rbx
	movq	%rdi, 8(%rbx)
	movq	%r14, %rsi
	callq	_memmove
	shlq	$3, %r12
	addq	%r12, 8(%rbx)
	cmpq	%r15, %r14
	je	LBB6_6
	movsd	-48(%rbp), %xmm0
	.align	4, 0x90
LBB6_14:
	movsd	%xmm0, (%r14)
	addq	$8, %r14
	cmpq	%r14, %r15
	jne	LBB6_14
	jmp	LBB6_6
LBB6_15:
	subq	(%rdi), %r15
	sarq	$3, %r15
	movabsq	$2305843009213693951, %rax
	subq	%r15, %rax
	cmpq	%rbx, %rax
	jb	LBB6_24
	cmpq	%rbx, %r15
	movq	%r15, %r12
	cmovbq	%rbx, %r12
	addq	%r15, %r12
	cmpq	%r15, %r12
	jae	LBB6_18
	movabsq	$2305843009213693951, %r12
	jmp	LBB6_19
LBB6_18:
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %r12
	ja	LBB6_25
LBB6_19:
	leaq	(,%r12,8), %rdi
	callq	__Znwm
	movq	%rax, %r15
	movq	-56(%rbp), %rdi
	movq	(%rdi), %rsi
	movq	%r14, %r13
	subq	%rsi, %r13
	movq	%r15, %rdi
	movq	%r13, %rdx
	callq	_memmove
	movq	%r13, %rax
	andq	$-8, %rax
	addq	%r15, %rax
	sarq	$3, %r13
	movq	-48(%rbp), %rcx
	movsd	(%rcx), %xmm0
	movq	%rbx, %rcx
	.align	4, 0x90
LBB6_20:
	movsd	%xmm0, (%rax)
	addq	$8, %rax
	decq	%rcx
	jne	LBB6_20
	addq	%rbx, %r13
	leaq	(%r15,%r13,8), %rdi
	movq	-56(%rbp), %rax
	movq	8(%rax), %rbx
	subq	%r14, %rbx
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	_memmove
	shrq	$3, %rbx
	movq	-56(%rbp), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	LBB6_23
	callq	__ZdlPv
LBB6_23:
	addq	%r13, %rbx
	leaq	(%r15,%rbx,8), %rax
	movq	-56(%rbp), %rdi
	movq	%r15, (%rdi)
	movq	%rax, 8(%rdi)
	leaq	(%r15,%r12,8), %rax
	movq	%rax, 16(%rdi)
	jmp	LBB6_6
LBB6_24:
	leaq	L_.str(%rip), %rdi
	callq	__ZSt20__throw_length_errorPKc
LBB6_25:
	callq	__ZSt17__throw_bad_allocv
Leh_func_end6:

	.globl	__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
.weak_definition __ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
	.align	1, 0x90
__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_:
Leh_func_begin7:
	pushq	%rbp
Ltmp90:
	movq	%rsp, %rbp
Ltmp91:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
Ltmp92:
	movq	%rcx, -128(%rbp)
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, %r15
	testq	%rbx, %rbx
	je	LBB7_26
	movq	8(%r15), %rcx
	movq	16(%r15), %rsi
	subq	%rcx, %rsi
	movabsq	$-6148914691236517205, %rdi
	movq	%rsi, %rax
	imulq	%rdi
	addq	%rdx, %rsi
	movq	%rsi, %rax
	shrq	$63, %rax
	sarq	$4, %rsi
	addq	%rax, %rsi
	cmpq	%rbx, %rsi
	jb	LBB7_27
	movq	-128(%rbp), %rcx
	movq	(%rcx), %rsi
	movq	8(%rcx), %r12
	movq	%r12, %rdi
	subq	%rsi, %rdi
	movq	%rdi, %r13
	sarq	$3, %r13
	testq	%r13, %r13
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -96(%rbp)
	jne	LBB7_4
	xorl	%r13d, %r13d
	jmp	LBB7_8
LBB7_4:
	movabsq	$2305843009213693952, %rcx
	cmpq	%rcx, %r13
	jb	LBB7_6
Ltmp52:
	callq	__ZSt17__throw_bad_allocv
Ltmp53:
LBB7_6:
Ltmp54:
	andq	$-8, %rdi
	callq	__Znwm
Ltmp55:
	movq	%rax, -112(%rbp)
	movq	%rax, -104(%rbp)
	leaq	(%rax,%r13,8), %rcx
	movq	%rcx, -96(%rbp)
	movq	-128(%rbp), %rcx
	movq	(%rcx), %rsi
	movq	8(%rcx), %r12
	movq	%rax, %r13
LBB7_8:
	subq	%rsi, %r12
	movq	%r13, %rdi
	movq	%r12, %rdx
	callq	_memmove
	andq	$-8, %r12
	addq	%r13, %r12
	movq	%r12, -104(%rbp)
	movq	8(%r15), %r12
	movq	%r12, %r13
	subq	%r14, %r13
	movabsq	$-6148914691236517205, %rcx
	movq	%r13, %rax
	imulq	%rcx
	addq	%rdx, %r13
	movq	%r13, %rcx
	shrq	$63, %rcx
	sarq	$4, %r13
	addq	%rcx, %r13
	cmpq	%rbx, %r13
	jbe	LBB7_18
	movq	%rbx, %rcx
	negq	%rcx
	leaq	(%rcx,%rcx,2), %rcx
	leaq	(%r12,%rcx,8), %r13
Ltmp57:
	movb	-48(%rbp), %al
	movb	%al, (%rsp)
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%r12, %rdx
	callq	__ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type
Ltmp58:
	leaq	(%rbx,%rbx,2), %rcx
	shlq	$3, %rcx
	addq	%rcx, 8(%r15)
	subq	%r14, %r13
	cmpq	$24, %r13
	jl	LBB7_14
	movabsq	$-6148914691236517205, %rcx
	movq	%r13, %rax
	imulq	%rcx
	addq	%rdx, %r13
	movq	%r13, %rcx
	shrq	$63, %rcx
	sarq	$4, %r13
	addq	%rcx, %r13
	xorl	%ecx, %ecx
	subq	%r13, %rcx
	movq	$-1, %rdi
	cmovnsq	%rcx, %rdi
	leaq	1(%rdi,%r13), %r15
	imulq	$-24, %rbx, %r13
	addq	$-24, %r12
	.align	4, 0x90
LBB7_12:
	leaq	(%r12,%r13), %rsi
Ltmp59:
	movq	%r12, %rdi
	callq	__ZNSt6vectorIdSaIdEEaSERKS1_
Ltmp60:
	addq	$-24, %r12
	decq	%r15
	jne	LBB7_12
LBB7_14:
	leaq	(,%rbx,8), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	testq	%rcx, %rcx
	je	LBB7_24
	leaq	-112(%rbp), %r15
	.align	4, 0x90
LBB7_16:
Ltmp61:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	__ZNSt6vectorIdSaIdEEaSERKS1_
Ltmp62:
	addq	$24, %r14
	decq	%rbx
	jne	LBB7_16
	jmp	LBB7_24
LBB7_18:
	subq	%r13, %rbx
Ltmp63:
	movb	-56(%rbp), %al
	movb	%al, (%rsp)
	leaq	-112(%rbp), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	__ZSt26__uninitialized_fill_n_auxIPSt6vectorIdSaIdEEmS2_EvT_T0_RKT1_St12__false_type
Ltmp64:
	leaq	(%rbx,%rbx,2), %rdx
	shlq	$3, %rdx
	addq	8(%r15), %rdx
	movq	%rdx, 8(%r15)
Ltmp65:
	movb	-64(%rbp), %al
	movb	%al, (%rsp)
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	__ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type
Ltmp66:
	leaq	(%r13,%r13,2), %rcx
	shlq	$3, %rcx
	addq	%rcx, 8(%r15)
	cmpq	%r12, %r14
	je	LBB7_24
	leaq	-112(%rbp), %rbx
	.align	4, 0x90
LBB7_22:
Ltmp67:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	__ZNSt6vectorIdSaIdEEaSERKS1_
Ltmp68:
	addq	$24, %r14
	cmpq	%r14, %r12
	jne	LBB7_22
LBB7_24:
	movq	-112(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB7_26
	callq	__ZdlPv
LBB7_26:
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB7_27:
	subq	(%r15), %rcx
	movq	%rcx, %rax
	imulq	%rdi
	addq	%rdx, %rcx
	movq	%rcx, %rax
	shrq	$63, %rax
	sarq	$4, %rcx
	addq	%rax, %rcx
	movabsq	$768614336404564650, %rax
	subq	%rcx, %rax
	cmpq	%rbx, %rax
	jb	LBB7_67
	cmpq	%rbx, %rcx
	movq	%rcx, %r12
	cmovbq	%rbx, %r12
	addq	%rcx, %r12
	cmpq	%rcx, %r12
	jae	LBB7_30
	movabsq	$768614336404564650, %r12
	jmp	LBB7_31
LBB7_30:
	movabsq	$768614336404564650, %rax
	cmpq	%rax, %r12
	ja	LBB7_68
LBB7_31:
	leaq	(,%r12,8), %rax
	leaq	(%rax,%rax,2), %rdi
	callq	__Znwm
	movq	(%r15), %rdi
	movq	%rax, -120(%rbp)
Ltmp69:
	movb	-72(%rbp), %cl
	movb	%cl, (%rsp)
	movq	%r14, %rsi
	movq	%rax, %rdx
	callq	__ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type
Ltmp70:
	movq	%rax, %r13
Ltmp71:
	movb	-80(%rbp), %al
	movb	%al, (%rsp)
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	-128(%rbp), %rdx
	callq	__ZSt26__uninitialized_fill_n_auxIPSt6vectorIdSaIdEEmS2_EvT_T0_RKT1_St12__false_type
Ltmp72:
	leaq	(%rbx,%rbx,2), %rax
	leaq	(%r13,%rax,8), %r13
	movq	8(%r15), %rsi
Ltmp73:
	movb	-88(%rbp), %al
	movb	%al, (%rsp)
	movq	%r14, %rdi
	movq	%r13, %rdx
	callq	__ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type
Ltmp74:
	movq	%rax, %r13
	movq	(%r15), %rbx
	movq	8(%r15), %r14
	cmpq	%r14, %rbx
	je	LBB7_42
	.align	4, 0x90
LBB7_35:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB7_37
	callq	__ZdlPv
LBB7_37:
	addq	$24, %rbx
	cmpq	%rbx, %r14
	jne	LBB7_35
	jmp	LBB7_41
LBB7_38:
	cmpq	$0, -120(%rbp)
	je	LBB7_40
	movq	-120(%rbp), %rdi
	callq	__ZdlPv
LBB7_40:
Ltmp75:
	callq	___cxa_rethrow
Ltmp76:
LBB7_41:
	movq	(%r15), %rbx
LBB7_42:
	testq	%rbx, %rbx
	je	LBB7_44
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB7_44:
	movq	-120(%rbp), %rax
	movq	%rax, (%r15)
	movq	%r13, 8(%r15)
	leaq	(%r12,%r12,2), %r13
	leaq	(%rax,%r13,8), %r13
	movq	%r13, 16(%r15)
	jmp	LBB7_26
LBB7_45:
Ltmp77:
	jmp	LBB7_54
LBB7_46:
Ltmp78:
	jmp	LBB7_54
LBB7_47:
Ltmp79:
	jmp	LBB7_54
LBB7_48:
Ltmp81:
	jmp	LBB7_54
LBB7_49:
Ltmp82:
	jmp	LBB7_54
LBB7_50:
Ltmp84:
	movq	%rax, %rdi
	jmp	LBB7_58
LBB7_51:
Ltmp85:
	movq	%rax, %rdi
	jmp	LBB7_58
LBB7_52:
Ltmp86:
	callq	__ZSt9terminatev
LBB7_53:
Ltmp80:
LBB7_54:
	movq	%rax, %r13
	movq	-112(%rbp), %rdi
	testq	%rdi, %rdi
	jne	LBB7_56
	movq	%r13, %rdi
	callq	__Unwind_Resume_or_Rethrow
LBB7_56:
	callq	__ZdlPv
	movq	%r13, %rdi
	callq	__Unwind_Resume_or_Rethrow
LBB7_57:
Ltmp83:
	movq	%rax, %rdi
	movq	-120(%rbp), %r13
LBB7_58:
	callq	___cxa_begin_catch
	cmpq	%r13, -120(%rbp)
	je	LBB7_38
	movq	-120(%rbp), %rbx
	.align	4, 0x90
LBB7_60:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB7_62
	callq	__ZdlPv
LBB7_62:
	addq	$24, %rbx
	cmpq	%rbx, %r13
	je	LBB7_38
	jmp	LBB7_60
LBB7_63:
Ltmp87:
	movq	%rax, %rbx
Ltmp88:
	callq	___cxa_end_catch
Ltmp89:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
LBB7_66:
Ltmp56:
	movq	%rax, %rdi
	callq	__Unwind_Resume_or_Rethrow
LBB7_67:
	leaq	L_.str(%rip), %rdi
	callq	__ZSt20__throw_length_errorPKc
LBB7_68:
	callq	__ZSt17__throw_bad_allocv
Leh_func_end7:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table7:
Lexception7:
	.byte	255
	.byte	155
	.byte	219
	.byte	129
	.space	1
	.byte	3
	.byte	208
	.byte	1
Lset44 = Ltmp52-Leh_func_begin7
	.long	Lset44
Lset45 = Ltmp55-Ltmp52
	.long	Lset45
Lset46 = Ltmp56-Leh_func_begin7
	.long	Lset46
	.byte	0
Lset47 = Ltmp55-Leh_func_begin7
	.long	Lset47
Lset48 = Ltmp57-Ltmp55
	.long	Lset48
	.long	0
	.byte	0
Lset49 = Ltmp57-Leh_func_begin7
	.long	Lset49
Lset50 = Ltmp58-Ltmp57
	.long	Lset50
Lset51 = Ltmp80-Leh_func_begin7
	.long	Lset51
	.byte	0
Lset52 = Ltmp59-Leh_func_begin7
	.long	Lset52
Lset53 = Ltmp60-Ltmp59
	.long	Lset53
Lset54 = Ltmp79-Leh_func_begin7
	.long	Lset54
	.byte	0
Lset55 = Ltmp61-Leh_func_begin7
	.long	Lset55
Lset56 = Ltmp62-Ltmp61
	.long	Lset56
Lset57 = Ltmp78-Leh_func_begin7
	.long	Lset57
	.byte	0
Lset58 = Ltmp63-Leh_func_begin7
	.long	Lset58
Lset59 = Ltmp64-Ltmp63
	.long	Lset59
Lset60 = Ltmp81-Leh_func_begin7
	.long	Lset60
	.byte	0
Lset61 = Ltmp65-Leh_func_begin7
	.long	Lset61
Lset62 = Ltmp66-Ltmp65
	.long	Lset62
Lset63 = Ltmp82-Leh_func_begin7
	.long	Lset63
	.byte	0
Lset64 = Ltmp67-Leh_func_begin7
	.long	Lset64
Lset65 = Ltmp68-Ltmp67
	.long	Lset65
Lset66 = Ltmp77-Leh_func_begin7
	.long	Lset66
	.byte	0
Lset67 = Ltmp68-Leh_func_begin7
	.long	Lset67
Lset68 = Ltmp69-Ltmp68
	.long	Lset68
	.long	0
	.byte	0
Lset69 = Ltmp69-Leh_func_begin7
	.long	Lset69
Lset70 = Ltmp70-Ltmp69
	.long	Lset70
Lset71 = Ltmp83-Leh_func_begin7
	.long	Lset71
	.byte	3
Lset72 = Ltmp71-Leh_func_begin7
	.long	Lset72
Lset73 = Ltmp72-Ltmp71
	.long	Lset73
Lset74 = Ltmp84-Leh_func_begin7
	.long	Lset74
	.byte	3
Lset75 = Ltmp73-Leh_func_begin7
	.long	Lset75
Lset76 = Ltmp74-Ltmp73
	.long	Lset76
Lset77 = Ltmp85-Leh_func_begin7
	.long	Lset77
	.byte	3
Lset78 = Ltmp75-Leh_func_begin7
	.long	Lset78
Lset79 = Ltmp76-Ltmp75
	.long	Lset79
Lset80 = Ltmp87-Leh_func_begin7
	.long	Lset80
	.byte	0
Lset81 = Ltmp76-Leh_func_begin7
	.long	Lset81
Lset82 = Ltmp88-Ltmp76
	.long	Lset82
	.long	0
	.byte	0
Lset83 = Ltmp88-Leh_func_begin7
	.long	Lset83
Lset84 = Ltmp89-Ltmp88
	.long	Lset84
Lset85 = Ltmp86-Leh_func_begin7
	.long	Lset85
	.byte	1
Lset86 = Ltmp89-Leh_func_begin7
	.long	Lset86
Lset87 = Leh_func_end7-Ltmp89
	.long	Lset87
	.long	0
	.byte	0


	.byte	127
	.byte	0

	.byte	1
	.byte	0

	.long	0

	.byte	0
	.align	2

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI8_0:
	.quad	4607182418800017408
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z20computeCholeskyTransRKSt6vectorIS_IdSaIdEESaIS1_EERS3_
	.align	4, 0x90
__Z20computeCholeskyTransRKSt6vectorIS_IdSaIdEESaIS1_EERS3_:
Leh_func_begin8:
	pushq	%rbp
Ltmp96:
	movq	%rsp, %rbp
Ltmp97:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
Ltmp98:
	movq	8(%rdi), %rcx
	subq	(%rdi), %rcx
	movq	%rcx, -88(%rbp)
	movabsq	$-6148914691236517205, %r8
	movq	%rcx, %rax
	imulq	%r8
	addq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$4, %rdx
	movq	%rdx, %rcx
	addq	%rax, %rcx
	movq	%rcx, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	(%rsi), %r9
	movq	8(%rsi), %rbx
	movq	%rbx, %r10
	subq	%r9, %r10
	movq	%r10, %rax
	imulq	%r8
	addq	%rdx, %r10
	movq	%r10, %rax
	shrq	$63, %rax
	sarq	$4, %r10
	addq	%rax, %r10
	cmpq	%rcx, %r10
	movq	%rsi, %r14
	movq	%rdi, %r15
	jbe	LBB8_7
	movq	%rcx, %rdx
	leaq	(%rdx,%rdx,2), %r10
	leaq	(%r9,%r10,8), %r10
	movq	%r10, -96(%rbp)
	cmpq	%r10, %rbx
	je	LBB8_6
	movq	%r10, %r12
	.align	4, 0x90
LBB8_3:
	movq	(%r12), %rdi
	testq	%rdi, %rdi
	je	LBB8_5
	callq	__ZdlPv
LBB8_5:
	addq	$24, %r12
	cmpq	%r12, %rbx
	jne	LBB8_3
LBB8_6:
	movq	-96(%rbp), %r10
	movq	%r10, 8(%r14)
	jmp	LBB8_10
LBB8_7:
	movq	-80(%rbp), %rdx
	subq	%r10, %rdx
Ltmp93:
	leaq	-72(%rbp), %rcx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
Ltmp94:
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB8_10
	callq	__ZdlPv
LBB8_10:
	movq	-88(%rbp), %rax
	addq	$23, %rax
	movq	%rax, -88(%rbp)
	cmpq	$47, %rax
	jb	LBB8_30
	movq	-80(%rbp), %rdx
	cmpq	$1, %rdx
	movl	$1, %ebx
	cmovaq	%rdx, %rbx
	xorl	%r12d, %r12d
	movq	%r12, %r13
	.align	4, 0x90
LBB8_12:
	movq	(%r14), %rdi
	movq	$0, -48(%rbp)
	movq	(%rdi,%r12), %rax
	movq	8(%rdi,%r12), %rsi
	movq	%rsi, %rcx
	subq	%rax, %rcx
	sarq	$3, %rcx
	cmpq	-80(%rbp), %rcx
	jbe	LBB8_34
	movq	-80(%rbp), %rdx
	leaq	(%rax,%rdx,8), %rax
	movq	%rax, 8(%rdi,%r12)
LBB8_14:
	xorl	%eax, %eax
	.align	4, 0x90
LBB8_15:
	movq	(%r14), %rcx
	movq	(%rcx,%r12), %rcx
	movq	$0, (%rcx,%rax,8)
	incq	%rax
	cmpq	%rax, %rbx
	jne	LBB8_15
	addq	$24, %r12
	incq	%r13
	cmpq	-80(%rbp), %r13
	jb	LBB8_12
	jmp	LBB8_17
LBB8_34:
	addq	%r12, %rdi
	movq	-80(%rbp), %rdx
	subq	%rcx, %rdx
	leaq	-48(%rbp), %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
	jmp	LBB8_14
LBB8_17:
	cmpq	$47, -88(%rbp)
	jb	LBB8_30
	xorl	%eax, %eax
	movsd	LCPI8_0(%rip), %xmm0
	movq	%rax, %rcx
	jmp	LBB8_28
	.align	4, 0x90
LBB8_19:
	movq	(%rdx,%r8,8), %r10
	pxor	%xmm1, %xmm1
	movq	%r9, %r11
	movq	%rsi, %rbx
	.align	4, 0x90
LBB8_20:
	movsd	(%rbx), %xmm2
	mulsd	(%r10), %xmm2
	addsd	%xmm2, %xmm1
	addq	$8, %rbx
	addq	$8, %r10
	decq	%r11
	jne	LBB8_20
LBB8_21:
	cmpq	%r9, %rdi
	jne	LBB8_23
	movq	(%r15), %rdx
	movq	(%rdx,%rax,8), %rdx
	movsd	(%rdx,%rdi,8), %xmm2
	subsd	%xmm1, %xmm2
	sqrtsd	%xmm2, %xmm1
	movsd	%xmm1, (%rsi,%rdi,8)
	jmp	LBB8_24
LBB8_23:
	movq	(%rdx,%r8,8), %rdx
	movapd	%xmm0, %xmm2
	divsd	(%rdx,%r9,8), %xmm2
	movq	(%r15), %rdx
	movq	(%rdx,%rax,8), %rdx
	movsd	(%rdx,%r9,8), %xmm3
	subsd	%xmm1, %xmm3
	mulsd	%xmm2, %xmm3
	movsd	%xmm3, (%rsi,%r9,8)
LBB8_24:
	addq	$3, %r8
	incq	%r9
	cmpq	%rcx, %r9
	jae	LBB8_27
LBB8_25:
	movq	(%r14), %rdx
	movq	(%rdx,%rax,8), %rsi
	testq	%r9, %r9
	jne	LBB8_19
	pxor	%xmm1, %xmm1
	jmp	LBB8_21
LBB8_27:
	addq	$3, %rax
	cmpq	-80(%rbp), %rcx
	jae	LBB8_30
LBB8_28:
	movq	%rcx, %rdi
	leaq	1(%rdi), %rcx
	cmpq	$-1, %rdi
	je	LBB8_27
	xorl	%r8d, %r8d
	movq	%r8, %r9
	jmp	LBB8_25
LBB8_30:
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB8_31:
Ltmp95:
	movq	%rax, %rbx
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB8_33
	callq	__ZdlPv
LBB8_33:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
Leh_func_end8:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table8:
Lexception8:
	.byte	255
	.byte	155
	.byte	156
	.space	1
	.byte	3
	.byte	26
Lset88 = Ltmp93-Leh_func_begin8
	.long	Lset88
Lset89 = Ltmp94-Ltmp93
	.long	Lset89
Lset90 = Ltmp95-Leh_func_begin8
	.long	Lset90
	.byte	0
Lset91 = Ltmp94-Leh_func_begin8
	.long	Lset91
Lset92 = Leh_func_end8-Ltmp94
	.long	Lset92
	.long	0
	.byte	0
	.align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z10multMatMatRKSt6vectorIS_IdSaIdEESaIS1_EES5_RS3_
	.align	4, 0x90
__Z10multMatMatRKSt6vectorIS_IdSaIdEESaIS1_EES5_RS3_:
Leh_func_begin9:
	pushq	%rbp
Ltmp102:
	movq	%rsp, %rbp
Ltmp103:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
Ltmp104:
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	8(%rdi), %rcx
	subq	(%rdi), %rcx
	movq	%rcx, -96(%rbp)
	movabsq	$-6148914691236517205, %rsi
	movq	%rcx, %rax
	imulq	%rsi
	addq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$4, %rdx
	movq	%rdx, %rcx
	addq	%rax, %rcx
	movq	%rcx, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	(%rbx), %r8
	movq	8(%rbx), %rax
	movq	%rax, -88(%rbp)
	movq	%rax, %r9
	subq	%r8, %r9
	movq	%r9, %rax
	imulq	%rsi
	addq	%rdx, %r9
	movq	%r9, %rax
	shrq	$63, %rax
	sarq	$4, %r9
	addq	%rax, %r9
	cmpq	%rcx, %r9
	movq	%rdi, %r15
	jbe	LBB9_7
	movq	%rcx, %rdx
	leaq	(%rdx,%rdx,2), %r9
	leaq	(%r8,%r9,8), %r9
	movq	%r9, -104(%rbp)
	cmpq	%r9, -88(%rbp)
	je	LBB9_6
	movq	%r9, %r12
	.align	4, 0x90
LBB9_3:
	movq	(%r12), %rdi
	testq	%rdi, %rdi
	je	LBB9_5
	callq	__ZdlPv
LBB9_5:
	addq	$24, %r12
	cmpq	%r12, -88(%rbp)
	jne	LBB9_3
LBB9_6:
	movq	-104(%rbp), %r9
	movq	%r9, 8(%rbx)
	jmp	LBB9_10
LBB9_7:
	movq	-80(%rbp), %rdx
	subq	%r9, %rdx
Ltmp99:
	leaq	-72(%rbp), %rcx
	movq	%rbx, %rdi
	movq	-88(%rbp), %rsi
	callq	__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
Ltmp100:
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB9_10
	callq	__ZdlPv
LBB9_10:
	movq	-96(%rbp), %rax
	addq	$23, %rax
	cmpq	$47, %rax
	jb	LBB9_17
	movq	-80(%rbp), %rdx
	cmpq	$1, %rdx
	movl	$1, %r12d
	cmovaq	%rdx, %r12
	xorl	%r13d, %r13d
	movq	%r13, -88(%rbp)
	.align	4, 0x90
LBB9_12:
	movq	(%rbx), %rdi
	movq	$0, -48(%rbp)
	movq	(%rdi,%r13), %rax
	movq	8(%rdi,%r13), %rsi
	movq	%rsi, %rcx
	subq	%rax, %rcx
	sarq	$3, %rcx
	cmpq	-80(%rbp), %rcx
	jbe	LBB9_18
	movq	-80(%rbp), %rdx
	leaq	(%rax,%rdx,8), %rcx
	movq	%rcx, 8(%rdi,%r13)
	jmp	LBB9_19
LBB9_18:
	addq	%r13, %rdi
	movq	-80(%rbp), %rdx
	subq	%rcx, %rdx
	leaq	-48(%rbp), %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
LBB9_19:
	xorl	%ecx, %ecx
	.align	4, 0x90
LBB9_20:
	movq	(%rbx), %rax
	movq	(%rax,%r13), %rax
	movq	$0, (%rax,%rcx,8)
	xorl	%eax, %eax
	movq	%rax, %rdx
	.align	4, 0x90
LBB9_14:
	movq	(%r14), %rsi
	movq	(%rsi,%rax,8), %rsi
	movq	(%r15), %rdi
	movq	(%rdi,%r13), %rdi
	movsd	(%rdi,%rdx,8), %xmm0
	mulsd	(%rsi,%rcx,8), %xmm0
	movq	(%rbx), %rsi
	movq	(%rsi,%r13), %rsi
	addsd	(%rsi,%rcx,8), %xmm0
	movsd	%xmm0, (%rsi,%rcx,8)
	addq	$3, %rax
	incq	%rdx
	cmpq	%rdx, %r12
	jne	LBB9_14
	incq	%rcx
	cmpq	-80(%rbp), %rcx
	jb	LBB9_20
	addq	$24, %r13
	movq	-88(%rbp), %rax
	incq	%rax
	movq	%rax, -88(%rbp)
	cmpq	-80(%rbp), %rax
	jb	LBB9_12
LBB9_17:
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB9_21:
Ltmp101:
	movq	%rax, %rbx
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB9_23
	callq	__ZdlPv
LBB9_23:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
Leh_func_end9:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table9:
Lexception9:
	.byte	255
	.byte	155
	.byte	156
	.space	1
	.byte	3
	.byte	26
Lset93 = Ltmp99-Leh_func_begin9
	.long	Lset93
Lset94 = Ltmp100-Ltmp99
	.long	Lset94
Lset95 = Ltmp101-Leh_func_begin9
	.long	Lset95
	.byte	0
Lset96 = Ltmp100-Leh_func_begin9
	.long	Lset96
Lset97 = Leh_func_end9-Ltmp100
	.long	Lset97
	.long	0
	.byte	0
	.align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z5transRKSt6vectorIS_IdSaIdEESaIS1_EERS3_
	.align	4, 0x90
__Z5transRKSt6vectorIS_IdSaIdEESaIS1_EERS3_:
Leh_func_begin10:
	pushq	%rbp
Ltmp108:
	movq	%rsp, %rbp
Ltmp109:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
Ltmp110:
	movq	8(%rdi), %rcx
	subq	(%rdi), %rcx
	movq	%rcx, -88(%rbp)
	movabsq	$-6148914691236517205, %r8
	movq	%rcx, %rax
	imulq	%r8
	addq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$4, %rdx
	movq	%rdx, %rcx
	addq	%rax, %rcx
	movq	%rcx, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	(%rsi), %r9
	movq	8(%rsi), %rbx
	movq	%rbx, %r10
	subq	%r9, %r10
	movq	%r10, %rax
	imulq	%r8
	addq	%rdx, %r10
	movq	%r10, %rax
	shrq	$63, %rax
	sarq	$4, %r10
	addq	%rax, %r10
	cmpq	%rcx, %r10
	movq	%rsi, %r14
	movq	%rdi, %r15
	jbe	LBB10_7
	movq	%rcx, %rdx
	leaq	(%rdx,%rdx,2), %r10
	leaq	(%r9,%r10,8), %r10
	movq	%r10, -96(%rbp)
	cmpq	%r10, %rbx
	je	LBB10_6
	movq	%r10, %r12
	.align	4, 0x90
LBB10_3:
	movq	(%r12), %rdi
	testq	%rdi, %rdi
	je	LBB10_5
	callq	__ZdlPv
LBB10_5:
	addq	$24, %r12
	cmpq	%r12, %rbx
	jne	LBB10_3
LBB10_6:
	movq	-96(%rbp), %r10
	movq	%r10, 8(%r14)
	jmp	LBB10_10
LBB10_7:
	movq	-80(%rbp), %rdx
	subq	%r10, %rdx
Ltmp105:
	leaq	-72(%rbp), %rcx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
Ltmp106:
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB10_10
	callq	__ZdlPv
LBB10_10:
	movq	-88(%rbp), %rax
	addq	$23, %rax
	cmpq	$47, %rax
	jb	LBB10_16
	movq	-80(%rbp), %rdx
	cmpq	$1, %rdx
	movl	$1, %ebx
	cmovaq	%rdx, %rbx
	xorl	%r12d, %r12d
	movq	%r12, %r13
	.align	4, 0x90
LBB10_12:
	movq	(%r14), %rdi
	movq	$0, -48(%rbp)
	movq	(%rdi,%r12), %rax
	movq	8(%rdi,%r12), %rsi
	movq	%rsi, %rcx
	subq	%rax, %rcx
	sarq	$3, %rcx
	cmpq	-80(%rbp), %rcx
	jbe	LBB10_17
	movq	-80(%rbp), %rdx
	leaq	(%rax,%rdx,8), %rcx
	movq	%rcx, 8(%rdi,%r12)
	jmp	LBB10_18
	.align	4, 0x90
LBB10_14:
	movq	(%r14), %rdx
	movq	(%rdx,%r12), %rdx
	movq	(%r15), %rsi
	movq	(%rsi,%rax,8), %rsi
	movsd	(%rsi,%r13,8), %xmm0
	movsd	%xmm0, (%rdx,%rcx,8)
	addq	$3, %rax
	incq	%rcx
	cmpq	%rcx, %rbx
	jne	LBB10_14
	addq	$24, %r12
	incq	%r13
	cmpq	-80(%rbp), %r13
	jb	LBB10_12
	jmp	LBB10_16
LBB10_17:
	addq	%r12, %rdi
	movq	-80(%rbp), %rdx
	subq	%rcx, %rdx
	leaq	-48(%rbp), %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
LBB10_18:
	xorl	%eax, %eax
	movq	%rax, %rcx
	jmp	LBB10_14
LBB10_16:
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB10_19:
Ltmp107:
	movq	%rax, %rbx
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB10_21
	callq	__ZdlPv
LBB10_21:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
Leh_func_end10:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table10:
Lexception10:
	.byte	255
	.byte	155
	.byte	156
	.space	1
	.byte	3
	.byte	26
Lset98 = Ltmp105-Leh_func_begin10
	.long	Lset98
Lset99 = Ltmp106-Ltmp105
	.long	Lset99
Lset100 = Ltmp107-Leh_func_begin10
	.long	Lset100
	.byte	0
Lset101 = Ltmp106-Leh_func_begin10
	.long	Lset101
Lset102 = Leh_func_end10-Ltmp106
	.long	Lset102
	.long	0
	.byte	0
	.align	2

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI11_0:
	.quad	4472074429978902528
LCPI11_1:
	.quad	-4616189618054758400
LCPI11_2:
	.quad	4607182418800017408
LCPI11_3:
	.quad	-4611686018427387904
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z17randomCorrelationmRSt6vectorIS_IdSaIdEESaIS1_EERj
	.align	4, 0x90
__Z17randomCorrelationmRSt6vectorIS_IdSaIdEESaIS1_EERj:
Leh_func_begin11:
	pushq	%rbp
Ltmp122:
	movq	%rsp, %rbp
Ltmp123:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$120, %rsp
Ltmp124:
	movq	%rdx, %rbx
	movq	%rsi, -160(%rbp)
	movq	%rdi, %r14
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
Ltmp111:
	leaq	-96(%rbp), %rdi
	xorl	%esi, %esi
	leaq	-72(%rbp), %rcx
	movq	%r14, %rdx
	callq	__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
Ltmp112:
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB11_3
	callq	__ZdlPv
LBB11_3:
	xorl	%r15d, %r15d
	movq	$-1, -152(%rbp)
	jmp	LBB11_13
	.align	4, 0x90
LBB11_4:
	leaq	24(%r15), %rax
	movq	%rax, -144(%rbp)
	movq	-96(%rbp), %rdi
	movq	$0, -48(%rbp)
	movq	(%rdi,%r15), %rax
	movq	8(%rdi,%r15), %rsi
	movq	%rsi, %rcx
	subq	%rax, %rcx
	sarq	$3, %rcx
	cmpq	%r14, %rcx
	jbe	LBB11_6
	leaq	(%rax,%r14,8), %rcx
	movq	%rcx, 8(%rdi,%r15)
	jmp	LBB11_7
LBB11_6:
	addq	%r15, %rdi
	movq	%r14, %rdx
	subq	%rcx, %rdx
Ltmp113:
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
Ltmp114:
LBB11_7:
	testq	%r14, %r14
	je	LBB11_12
	xorl	%r12d, %r12d
	.align	4, 0x90
LBB11_9:
	movq	-96(%rbp), %rax
	movq	(%rax,%r15), %r13
	movl	(%rbx), %eax
	.align	4, 0x90
LBB11_10:
	imull	$300773, %eax, %eax
	andl	$1073741823, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	LCPI11_0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm0
	movsd	LCPI11_1(%rip), %xmm2
	addsd	%xmm2, %xmm0
	movsd	%xmm0, -128(%rbp)
	mulsd	%xmm0, %xmm0
	imull	$300773, %eax, %eax
	andl	$1073741823, %eax
	cvtsi2sd	%eax, %xmm3
	mulsd	%xmm1, %xmm3
	addsd	%xmm3, %xmm3
	addsd	%xmm2, %xmm3
	mulsd	%xmm3, %xmm3
	addsd	%xmm0, %xmm3
	movsd	%xmm3, -136(%rbp)
	ucomisd	LCPI11_2(%rip), %xmm3
	jae	LBB11_10
	movl	%eax, (%rbx)
	movapd	%xmm3, %xmm0
	callq	_log
	mulsd	LCPI11_3(%rip), %xmm0
	divsd	-136(%rbp), %xmm0
	sqrtsd	%xmm0, %xmm0
	movsd	-128(%rbp), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%r13,%r12,8)
	incq	%r12
	cmpq	%r12, %r14
	jne	LBB11_9
LBB11_12:
	movq	-144(%rbp), %r15
LBB11_13:
	movq	-152(%rbp), %rax
	incq	%rax
	movq	%rax, -152(%rbp)
	cmpq	$10, %rax
	jb	LBB11_4
	testq	%r14, %r14
	je	LBB11_21
	xorl	%eax, %eax
	.align	4, 0x90
LBB11_16:
	pxor	%xmm0, %xmm0
	movq	-96(%rbp), %rcx
	movq	%r14, %rdx
	.align	4, 0x90
LBB11_17:
	movq	(%rcx), %rsi
	movsd	(%rsi,%rax,8), %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	addq	$24, %rcx
	decq	%rdx
	jne	LBB11_17
	sqrtsd	%xmm0, %xmm0
	xorl	%ecx, %ecx
	movq	%r14, %rdx
	.align	4, 0x90
LBB11_19:
	movq	-96(%rbp), %rsi
	movq	(%rsi,%rcx), %rsi
	movsd	(%rsi,%rax,8), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, (%rsi,%rax,8)
	addq	$24, %rcx
	decq	%rdx
	jne	LBB11_19
	incq	%rax
	cmpq	%rax, %r14
	jne	LBB11_16
LBB11_21:
	movq	$0, -120(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
Ltmp115:
	leaq	-96(%rbp), %rdi
	leaq	-120(%rbp), %rsi
	callq	__Z5transRKSt6vectorIS_IdSaIdEESaIS1_EERS3_
Ltmp116:
Ltmp117:
	leaq	-120(%rbp), %rdi
	leaq	-96(%rbp), %rsi
	movq	-160(%rbp), %rdx
	callq	__Z10multMatMatRKSt6vectorIS_IdSaIdEESaIS1_EES5_RS3_
Ltmp118:
	movq	-120(%rbp), %rbx
	movq	-112(%rbp), %r14
	cmpq	%r14, %rbx
	je	LBB11_28
	.align	4, 0x90
LBB11_24:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB11_26
	callq	__ZdlPv
LBB11_26:
	addq	$24, %rbx
	cmpq	%rbx, %r14
	jne	LBB11_24
	movq	-120(%rbp), %rbx
LBB11_28:
	testq	%rbx, %rbx
	je	LBB11_30
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB11_30:
	movq	-96(%rbp), %rbx
	movq	-88(%rbp), %r14
	cmpq	%r14, %rbx
	je	LBB11_35
	.align	4, 0x90
LBB11_31:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB11_33
	callq	__ZdlPv
LBB11_33:
	addq	$24, %rbx
	cmpq	%rbx, %r14
	jne	LBB11_31
	movq	-96(%rbp), %rbx
LBB11_35:
	testq	%rbx, %rbx
	je	LBB11_37
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB11_37:
	addq	$120, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB11_38:
Ltmp119:
	movq	%rax, %rbx
	jmp	LBB11_48
LBB11_39:
Ltmp120:
	movq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	movq	%rax, %rbx
	jne	LBB11_47
	jmp	LBB11_48
LBB11_40:
Ltmp121:
	movq	-120(%rbp), %r14
	movq	-112(%rbp), %r15
	cmpq	%r15, %r14
	movq	%rax, %rbx
	je	LBB11_45
	.align	4, 0x90
LBB11_41:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB11_43
	callq	__ZdlPv
LBB11_43:
	addq	$24, %r14
	cmpq	%r14, %r15
	jne	LBB11_41
	movq	-120(%rbp), %r14
LBB11_45:
	testq	%r14, %r14
	je	LBB11_48
	movq	%r14, %rdi
LBB11_47:
	callq	__ZdlPv
LBB11_48:
	movq	-96(%rbp), %r14
	movq	-88(%rbp), %r15
	cmpq	%r15, %r14
	je	LBB11_53
	.align	4, 0x90
LBB11_49:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB11_51
	callq	__ZdlPv
LBB11_51:
	addq	$24, %r14
	cmpq	%r14, %r15
	jne	LBB11_49
	movq	-96(%rbp), %r14
LBB11_53:
	testq	%r14, %r14
	je	LBB11_55
	movq	%r14, %rdi
	callq	__ZdlPv
LBB11_55:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
Leh_func_end11:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table11:
Lexception11:
	.byte	255
	.byte	155
	.byte	195
	.space	1,128
	.space	1
	.byte	3
	.byte	65
Lset103 = Ltmp111-Leh_func_begin11
	.long	Lset103
Lset104 = Ltmp112-Ltmp111
	.long	Lset104
Lset105 = Ltmp120-Leh_func_begin11
	.long	Lset105
	.byte	0
Lset106 = Ltmp113-Leh_func_begin11
	.long	Lset106
Lset107 = Ltmp114-Ltmp113
	.long	Lset107
Lset108 = Ltmp119-Leh_func_begin11
	.long	Lset108
	.byte	0
Lset109 = Ltmp114-Leh_func_begin11
	.long	Lset109
Lset110 = Ltmp115-Ltmp114
	.long	Lset110
	.long	0
	.byte	0
Lset111 = Ltmp115-Leh_func_begin11
	.long	Lset111
Lset112 = Ltmp118-Ltmp115
	.long	Lset112
Lset113 = Ltmp121-Leh_func_begin11
	.long	Lset113
	.byte	0
Lset114 = Ltmp118-Leh_func_begin11
	.long	Lset114
Lset115 = Leh_func_end11-Ltmp118
	.long	Lset115
	.long	0
	.byte	0
	.align	2

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI12_0:
	.quad	4472074429978902528
LCPI12_1:
	.quad	-4616189618054758400
LCPI12_2:
	.quad	4607182418800017408
LCPI12_3:
	.quad	-4611686018427387904
	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.globl	__Z8runTrialmmddRKSt6vectorIS_IdSaIdEESaIS1_EERKS1_
.weak_definition __Z8runTrialmmddRKSt6vectorIS_IdSaIdEESaIS1_EERKS1_
	.align	4, 0x90
__Z8runTrialmmddRKSt6vectorIS_IdSaIdEESaIS1_EERKS1_:
Leh_func_begin12:
	pushq	%rbp
Ltmp134:
	movq	%rsp, %rbp
Ltmp135:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$152, %rsp
Ltmp136:
	movq	8(%rcx), %rax
	subq	(%rcx), %rax
	movq	%rax, -184(%rbp)
	shlq	$12, %rdi
	addq	$4096, %rdi
	movl	$1, %ebx
	movl	$300773, %eax
	movl	$1, %r8d
	movl	$64, %r9d
	movq	%rcx, -176(%rbp)
	movq	%rdx, %r14
	movsd	%xmm1, -160(%rbp)
	movsd	%xmm0, -168(%rbp)
	movq	%rsi, -192(%rbp)
	.align	4, 0x90
LBB12_1:
	testq	%rdi, %r8
	je	LBB12_3
	imull	%eax, %ebx
	andl	$1073741823, %ebx
LBB12_3:
	addq	%r8, %r8
	imull	%eax, %eax
	andl	$1073741823, %eax
	decl	%r9d
	jne	LBB12_1
	movq	$0, -88(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -48(%rbp)
	movq	-184(%rbp), %rax
	sarq	$3, %rax
	movq	%rax, -184(%rbp)
Ltmp125:
	leaq	-88(%rbp), %rdi
	xorl	%esi, %esi
	leaq	-48(%rbp), %rcx
	movq	%rax, %rdx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
Ltmp126:
	movq	-88(%rbp), %rax
	movabsq	$4636737291354636288, %rcx
	movq	%rcx, (%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 8(%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 16(%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 24(%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 32(%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 40(%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 48(%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 56(%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 64(%rax)
	movq	-88(%rbp), %rax
	movq	%rcx, 72(%rax)
	movq	$-1, %r15
	jmp	LBB12_22
	.align	4, 0x90
LBB12_6:
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -56(%rbp)
Ltmp127:
	xorl	%r12d, %r12d
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	xorl	%esi, %esi
	movq	-184(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rax, %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
Ltmp128:
	.align	4, 0x90
LBB12_7:
	movq	-112(%rbp), %r13
	.align	4, 0x90
LBB12_8:
	imull	$300773, %ebx, %ebx
	andl	$1073741823, %ebx
	cvtsi2sd	%ebx, %xmm0
	movsd	LCPI12_0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm0
	movsd	LCPI12_1(%rip), %xmm2
	addsd	%xmm2, %xmm0
	movsd	%xmm0, -144(%rbp)
	mulsd	%xmm0, %xmm0
	imull	$300773, %ebx, %ebx
	andl	$1073741823, %ebx
	cvtsi2sd	%ebx, %xmm3
	mulsd	%xmm1, %xmm3
	addsd	%xmm3, %xmm3
	addsd	%xmm2, %xmm3
	mulsd	%xmm3, %xmm3
	addsd	%xmm0, %xmm3
	movsd	%xmm3, -152(%rbp)
	ucomisd	LCPI12_2(%rip), %xmm3
	jae	LBB12_8
	movapd	%xmm3, %xmm0
	callq	_log
	mulsd	LCPI12_3(%rip), %xmm0
	divsd	-152(%rbp), %xmm0
	sqrtsd	%xmm0, %xmm0
	movsd	-144(%rbp), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%r13,%r12,8)
	incq	%r12
	cmpq	$10, %r12
	jne	LBB12_7
	movq	$0, -136(%rbp)
	movq	$0, -128(%rbp)
	movq	$0, -120(%rbp)
	movq	-104(%rbp), %r12
	subq	-112(%rbp), %r12
	movq	$0, -64(%rbp)
	sarq	$3, %r12
Ltmp129:
	xorl	%esi, %esi
	leaq	-136(%rbp), %rdi
	movq	%r12, %rdx
	leaq	-64(%rbp), %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
Ltmp130:
	testq	%r12, %r12
	je	LBB12_16
	xorl	%eax, %eax
	movq	%rax, %rcx
	movq	%rax, %rdx
	.align	4, 0x90
LBB12_13:
	movq	-136(%rbp), %rsi
	movq	$0, (%rsi,%rdx,8)
	movq	%rax, %rsi
	.align	4, 0x90
LBB12_14:
	movq	(%r14), %rdi
	movq	(%rdi,%rcx,8), %rdi
	movsd	(%rdi,%rsi,8), %xmm0
	movq	-112(%rbp), %rdi
	mulsd	(%rdi,%rsi,8), %xmm0
	movq	-136(%rbp), %rdi
	addsd	(%rdi,%rdx,8), %xmm0
	movsd	%xmm0, (%rdi,%rdx,8)
	incq	%rsi
	cmpq	%rsi, %r12
	jne	LBB12_14
	addq	$3, %rcx
	incq	%rdx
	cmpq	%rdx, %r12
	jne	LBB12_13
LBB12_16:
	xorl	%r12d, %r12d
	.align	4, 0x90
LBB12_17:
	movq	-136(%rbp), %rax
	movsd	(%rax,%r12,8), %xmm1
	mulsd	-160(%rbp), %xmm1
	movq	-176(%rbp), %rcx
	movq	(%rcx), %rax
	movsd	(%rax,%r12,8), %xmm0
	mulsd	-168(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	callq	_exp
	movq	-88(%rbp), %rax
	mulsd	(%rax,%r12,8), %xmm0
	movsd	%xmm0, (%rax,%r12,8)
	incq	%r12
	cmpq	$10, %r12
	jne	LBB12_17
	movq	-136(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB12_20
	callq	__ZdlPv
LBB12_20:
	movq	-112(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB12_22
	callq	__ZdlPv
LBB12_22:
	incq	%r15
	cmpq	-192(%rbp), %r15
	jb	LBB12_6
	cmpq	$0, -184(%rbp)
	movq	-88(%rbp), %rdi
	je	LBB12_38
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -144(%rbp)
	movq	%rdi, %rax
	.align	4, 0x90
LBB12_25:
	movsd	-144(%rbp), %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, -144(%rbp)
	addq	$8, %rax
	decq	-184(%rbp)
	jne	LBB12_25
LBB12_26:
	testq	%rdi, %rdi
	je	LBB12_28
	callq	__ZdlPv
LBB12_28:
	movsd	-144(%rbp), %xmm0
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB12_29:
Ltmp133:
	movq	-136(%rbp), %rdi
	testq	%rdi, %rdi
	movq	%rax, %rbx
	je	LBB12_36
	callq	__ZdlPv
	jmp	LBB12_36
LBB12_31:
Ltmp131:
	movq	%rax, %rbx
LBB12_32:
	movq	-88(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB12_34
	callq	__ZdlPv
LBB12_34:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
LBB12_35:
Ltmp132:
	movq	%rax, %rbx
LBB12_36:
	movq	-112(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB12_32
	callq	__ZdlPv
	jmp	LBB12_32
LBB12_38:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -144(%rbp)
	jmp	LBB12_26
Leh_func_end12:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table12:
Lexception12:
	.byte	255
	.byte	155
	.byte	195
	.space	1,128
	.space	1
	.byte	3
	.byte	65
Lset116 = Ltmp125-Leh_func_begin12
	.long	Lset116
Lset117 = Ltmp126-Ltmp125
	.long	Lset117
Lset118 = Ltmp131-Leh_func_begin12
	.long	Lset118
	.byte	0
Lset119 = Ltmp127-Leh_func_begin12
	.long	Lset119
Lset120 = Ltmp128-Ltmp127
	.long	Lset120
Lset121 = Ltmp132-Leh_func_begin12
	.long	Lset121
	.byte	0
Lset122 = Ltmp128-Leh_func_begin12
	.long	Lset122
Lset123 = Ltmp129-Ltmp128
	.long	Lset123
	.long	0
	.byte	0
Lset124 = Ltmp129-Leh_func_begin12
	.long	Lset124
Lset125 = Ltmp130-Ltmp129
	.long	Lset125
Lset126 = Ltmp133-Leh_func_begin12
	.long	Lset126
	.byte	0
Lset127 = Ltmp130-Leh_func_begin12
	.long	Lset127
Lset128 = Leh_func_end12-Ltmp130
	.long	Lset128
	.long	0
	.byte	0
	.align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z11threadEntryPv
	.align	4, 0x90
__Z11threadEntryPv:
Leh_func_begin13:
	pushq	%rbp
Ltmp137:
	movq	%rsp, %rbp
Ltmp138:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$8, %rsp
Ltmp139:
	movq	8(%rdi), %rbx
	cmpq	%rbx, 16(%rdi)
	je	LBB13_3
	movq	%rdi, %r14
	.align	4, 0x90
LBB13_2:
	movq	(%r14), %rax
	movq	24(%r14), %r15
	movq	(%rax), %rsi
	movsd	8(%rax), %xmm0
	movsd	16(%rax), %xmm1
	leaq	24(%rax), %rdx
	leaq	48(%rax), %rcx
	movq	%rbx, %rdi
	callq	__Z8runTrialmmddRKSt6vectorIS_IdSaIdEESaIS1_EERKS1_
	movsd	%xmm0, (%r15,%rbx,8)
	incq	%rbx
	cmpq	16(%r14), %rbx
	jne	LBB13_2
LBB13_3:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
Leh_func_end13:

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI14_0:
	.quad	4985484787500187648
LCPI14_1:
	.quad	4627730092099895296
LCPI14_2:
	.quad	-4620693217682128896
LCPI14_3:
	.quad	4652007308841189376
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:
Leh_func_begin14:
	pushq	%rbp
Ltmp171:
	movq	%rsp, %rbp
Ltmp172:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$552, %rsp
Ltmp173:
	movl	$8388608, %edi
	callq	__Znam
	movq	%rax, -592(%rbp)
	movq	$0, -144(%rbp)
	movq	$0, -136(%rbp)
	movq	$0, -128(%rbp)
	movq	$0, -120(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$252, -168(%rbp)
	movabsq	$4571225107489424400, %rax
	movq	%rax, -160(%rbp)
	movabsq	$4589203622422641306, %rax
	movq	%rax, -152(%rbp)
	movq	$0, -192(%rbp)
	movq	$0, -184(%rbp)
	movq	$0, -176(%rbp)
	movq	$0, -48(%rbp)
Ltmp140:
	leaq	-192(%rbp), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	leaq	-48(%rbp), %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
Ltmp141:
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	movabsq	$4985484787499139072, %rbx
	addq	%rbx, %rcx
	movd	%rcx, %xmm0
	movsd	LCPI14_0(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movl	%eax, %eax
	movabsq	$4841369599423283200, %r14
	addq	%r14, %rax
	movd	%rax, %xmm2
	addsd	%xmm0, %xmm2
	movsd	LCPI14_1(%rip), %xmm0
	movapd	%xmm0, %xmm3
	divsd	%xmm2, %xmm3
	movq	-192(%rbp), %rax
	movsd	%xmm3, (%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-192(%rbp), %rax
	movsd	%xmm2, 8(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-192(%rbp), %rax
	movsd	%xmm2, 16(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-192(%rbp), %rax
	movsd	%xmm2, 24(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-192(%rbp), %rax
	movsd	%xmm2, 32(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-192(%rbp), %rax
	movsd	%xmm2, 40(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-192(%rbp), %rax
	movsd	%xmm2, 48(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-192(%rbp), %rax
	movsd	%xmm2, 56(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-192(%rbp), %rax
	movsd	%xmm2, 64(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm1
	addsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	movq	-192(%rbp), %rax
	movsd	%xmm0, 72(%rax)
	movq	$0, -216(%rbp)
	movq	$0, -208(%rbp)
	movq	$0, -200(%rbp)
	movq	$0, -56(%rbp)
Ltmp142:
	leaq	-216(%rbp), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	leaq	-56(%rbp), %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
Ltmp143:
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm0
	movsd	LCPI14_0(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm2
	addsd	%xmm0, %xmm2
	movsd	LCPI14_1(%rip), %xmm0
	movapd	%xmm0, %xmm3
	divsd	%xmm2, %xmm3
	movq	-216(%rbp), %rax
	movsd	%xmm3, (%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-216(%rbp), %rax
	movsd	%xmm2, 8(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-216(%rbp), %rax
	movsd	%xmm2, 16(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-216(%rbp), %rax
	movsd	%xmm2, 24(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-216(%rbp), %rax
	movsd	%xmm2, 32(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-216(%rbp), %rax
	movsd	%xmm2, 40(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-216(%rbp), %rax
	movsd	%xmm2, 48(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-216(%rbp), %rax
	movsd	%xmm2, 56(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm3
	addsd	%xmm2, %xmm3
	movapd	%xmm0, %xmm2
	divsd	%xmm3, %xmm2
	movq	-216(%rbp), %rax
	movsd	%xmm2, 64(%rax)
	movq	-168(%rbp), %rax
	movq	%rax, %rcx
	shrq	$32, %rcx
	addq	%rbx, %rcx
	movd	%rcx, %xmm2
	subsd	%xmm1, %xmm2
	movl	%eax, %eax
	addq	%r14, %rax
	movd	%rax, %xmm1
	addsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	movq	-216(%rbp), %rax
	movsd	%xmm0, 72(%rax)
	movl	$1, -220(%rbp)
	movq	$0, -248(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -232(%rbp)
Ltmp144:
	movl	$10, %edi
	leaq	-248(%rbp), %rsi
	leaq	-220(%rbp), %rdx
	callq	__Z17randomCorrelationmRSt6vectorIS_IdSaIdEESaIS1_EERj
Ltmp145:
	movq	$0, -272(%rbp)
	movq	$0, -264(%rbp)
	movq	$0, -256(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -80(%rbp)
Ltmp146:
	leaq	-272(%rbp), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	leaq	-96(%rbp), %rcx
	callq	__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
Ltmp147:
	movq	-96(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB14_6
	callq	__ZdlPv
LBB14_6:
	xorl	%ebx, %ebx
	movq	%rbx, %r14
	jmp	LBB14_7
	.align	4, 0x90
LBB14_9:
	addq	$80, %rcx
	movq	%rcx, 8(%rdi,%rbx)
	xorl	%eax, %eax
	.align	4, 0x90
LBB14_10:
	movq	-216(%rbp), %rcx
	movsd	(%rcx,%r14,8), %xmm0
	mulsd	(%rcx,%rax,8), %xmm0
	movq	-248(%rbp), %rcx
	movq	(%rcx,%rbx), %rcx
	mulsd	(%rcx,%rax,8), %xmm0
	movq	-272(%rbp), %rcx
	movq	(%rcx,%rbx), %rcx
	movsd	%xmm0, (%rcx,%rax,8)
	incq	%rax
	cmpq	$10, %rax
	jne	LBB14_10
	addq	$24, %rbx
	incq	%r14
LBB14_7:
	cmpq	$10, %r14
	jae	LBB14_14
	movq	-272(%rbp), %rdi
	movq	$0, -64(%rbp)
	movq	(%rdi,%rbx), %rcx
	movq	8(%rdi,%rbx), %rsi
	movq	%rsi, %rax
	subq	%rcx, %rax
	sarq	$3, %rax
	cmpq	$11, %rax
	jae	LBB14_9
	addq	%rbx, %rdi
	movl	$10, %edx
	subq	%rax, %rdx
Ltmp148:
	leaq	-64(%rbp), %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
Ltmp149:
	xorl	%eax, %eax
	jmp	LBB14_10
LBB14_14:
Ltmp150:
	leaq	-272(%rbp), %rdi
	leaq	-144(%rbp), %rsi
	callq	__Z20computeCholeskyTransRKSt6vectorIS_IdSaIdEESaIS1_EERS3_
Ltmp151:
	movq	$0, -72(%rbp)
	movq	-120(%rbp), %rax
	movq	-112(%rbp), %rsi
	movq	%rsi, %rcx
	subq	%rax, %rcx
	sarq	$3, %rcx
	cmpq	$11, %rcx
	jb	LBB14_17
	addq	$80, %rax
	movq	%rax, -112(%rbp)
	jmp	LBB14_18
LBB14_17:
	movl	$10, %edx
	subq	%rcx, %rdx
Ltmp152:
	leaq	-120(%rbp), %rdi
	leaq	-72(%rbp), %rcx
	callq	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd
Ltmp153:
LBB14_18:
	xorl	%ecx, %ecx
	movq	%rcx, %rax
	.align	4, 0x90
LBB14_19:
	movq	-272(%rbp), %rdx
	movq	(%rdx,%rcx,8), %rdx
	movsd	(%rdx,%rax,8), %xmm0
	mulsd	LCPI14_2(%rip), %xmm0
	movq	-192(%rbp), %rdx
	addsd	(%rdx,%rax,8), %xmm0
	movq	-120(%rbp), %rdx
	movsd	%xmm0, (%rdx,%rax,8)
	addq	$3, %rcx
	incq	%rax
	cmpq	$10, %rax
	jne	LBB14_19
	xorl	%ebx, %ebx
	leaq	-584(%rbp), %r14
	leaq	-528(%rbp), %r15
	jmp	LBB14_32
	.align	4, 0x90
LBB14_21:
	testq	%rbx, %rbx
	jne	LBB14_23
	xorl	%r12d, %r12d
	jmp	LBB14_24
LBB14_23:
	movq	-16(%r15), %r12
LBB14_24:
	movq	%r12, 8(%r15)
	cmpq	$7, %rbx
	jne	LBB14_30
	movq	$1048576, 16(%r15)
	leaq	-168(%rbp), %rax
	movq	%rax, (%r15)
	movq	-592(%rbp), %rax
	movq	%rax, 24(%r15)
	cmpq	$1048576, %r12
	je	LBB14_31
	leaq	-168(%rbp), %rax
	movq	-592(%rbp), %r13
	jmp	LBB14_27
	.align	4, 0x90
LBB14_29:
	movq	(%r15), %rax
	movq	24(%r15), %r13
LBB14_27:
	movq	(%rax), %rsi
	movsd	8(%rax), %xmm0
	movsd	16(%rax), %xmm1
Ltmp154:
	leaq	24(%rax), %rdx
	leaq	48(%rax), %rcx
	movq	%r12, %rdi
	callq	__Z8runTrialmmddRKSt6vectorIS_IdSaIdEESaIS1_EERKS1_
Ltmp155:
	movsd	%xmm0, (%r13,%r12,8)
	incq	%r12
	cmpq	16(%r15), %r12
	je	LBB14_31
	jmp	LBB14_29
LBB14_30:
	addq	$131072, %r12
	movq	%r12, 16(%r15)
	leaq	-168(%rbp), %rax
	movq	%rax, (%r15)
	movq	-592(%rbp), %rdi
	movq	%rdi, 24(%r15)
Ltmp156:
	xorl	%esi, %esi
	movq	%r14, %rdi
	leaq	__Z11threadEntryPv(%rip), %rdx
	movq	%r15, %rcx
	callq	_pthread_create
Ltmp157:
LBB14_31:
	addq	$32, %r15
	addq	$8, %r14
	incq	%rbx
LBB14_32:
	cmpq	$8, %rbx
	jb	LBB14_21
	xorl	%ebx, %ebx
	jmp	LBB14_36
	.align	4, 0x90
LBB14_34:
	movq	-584(%rbp,%rbx,8), %rdi
Ltmp158:
	xorl	%esi, %esi
	callq	_pthread_join
Ltmp159:
	incq	%rbx
LBB14_36:
	cmpq	$7, %rbx
	jb	LBB14_34
Ltmp160:
	movl	$1048576, %esi
	movl	$8, %edx
	leaq	__Z13doubleComparePKvS0_(%rip), %rcx
	movq	-592(%rbp), %rdi
	callq	_qsort
Ltmp161:
	movq	-592(%rbp), %rbx
	movsd	419424(%rbx), %xmm1
	movsd	LCPI14_3(%rip), %xmm0
	subsd	%xmm1, %xmm0
	leaq	L_.str1(%rip), %rdi
	movb	$1, %al
	callq	_printf
	testq	%rbx, %rbx
	je	LBB14_40
	movq	%rbx, %rdi
	callq	__ZdaPv
LBB14_40:
	movq	-272(%rbp), %rbx
	movq	-264(%rbp), %r14
	cmpq	%r14, %rbx
	je	LBB14_45
	.align	4, 0x90
LBB14_41:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB14_43
	callq	__ZdlPv
LBB14_43:
	addq	$24, %rbx
	cmpq	%rbx, %r14
	jne	LBB14_41
	movq	-272(%rbp), %rbx
LBB14_45:
	testq	%rbx, %rbx
	je	LBB14_47
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB14_47:
	movq	-248(%rbp), %rbx
	movq	-240(%rbp), %r14
	cmpq	%r14, %rbx
	je	LBB14_52
	.align	4, 0x90
LBB14_48:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB14_50
	callq	__ZdlPv
LBB14_50:
	addq	$24, %rbx
	cmpq	%rbx, %r14
	jne	LBB14_48
	movq	-248(%rbp), %rbx
LBB14_52:
	testq	%rbx, %rbx
	je	LBB14_54
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB14_54:
	movq	-216(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB14_56
	callq	__ZdlPv
LBB14_56:
	movq	-192(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB14_58
	callq	__ZdlPv
LBB14_58:
	movq	-120(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB14_60
	callq	__ZdlPv
LBB14_60:
	movq	-144(%rbp), %rbx
	movq	-136(%rbp), %r14
	cmpq	%r14, %rbx
	je	LBB14_65
	.align	4, 0x90
LBB14_61:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB14_63
	callq	__ZdlPv
LBB14_63:
	addq	$24, %rbx
	cmpq	%rbx, %r14
	jne	LBB14_61
	movq	-144(%rbp), %rbx
LBB14_65:
	testq	%rbx, %rbx
	je	LBB14_67
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB14_67:
	xorl	%eax, %eax
	addq	$552, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
LBB14_68:
Ltmp165:
	movq	%rax, %rbx
	jmp	LBB14_76
LBB14_69:
Ltmp166:
	movq	%rax, %rbx
	jmp	LBB14_76
LBB14_70:
Ltmp167:
	movq	%rax, %rbx
	jmp	LBB14_76
LBB14_71:
Ltmp168:
	movq	%rax, %rbx
	jmp	LBB14_76
LBB14_72:
Ltmp169:
	movq	%rax, %rbx
	jmp	LBB14_76
LBB14_74:
Ltmp170:
	movq	-96(%rbp), %rdi
	testq	%rdi, %rdi
	movq	%rax, %rbx
	je	LBB14_76
	callq	__ZdlPv
LBB14_76:
	movq	-272(%rbp), %r14
	movq	-264(%rbp), %r15
	cmpq	%r15, %r14
	je	LBB14_81
	.align	4, 0x90
LBB14_77:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB14_79
	callq	__ZdlPv
LBB14_79:
	addq	$24, %r14
	cmpq	%r14, %r15
	jne	LBB14_77
	movq	-272(%rbp), %r14
LBB14_81:
	testq	%r14, %r14
	je	LBB14_100
	movq	%r14, %rdi
	callq	__ZdlPv
	jmp	LBB14_100
LBB14_83:
	movq	-120(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB14_85
	callq	__ZdlPv
LBB14_85:
	movq	-144(%rbp), %r14
	movq	-136(%rbp), %r15
	cmpq	%r15, %r14
	je	LBB14_90
	.align	4, 0x90
LBB14_86:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB14_88
	callq	__ZdlPv
LBB14_88:
	addq	$24, %r14
	cmpq	%r14, %r15
	jne	LBB14_86
	movq	-144(%rbp), %r14
LBB14_90:
	testq	%r14, %r14
	je	LBB14_92
	movq	%r14, %rdi
	callq	__ZdlPv
LBB14_92:
	movq	%rbx, %rdi
	callq	__Unwind_Resume_or_Rethrow
LBB14_93:
Ltmp162:
	movq	%rax, %rbx
LBB14_94:
	movq	-192(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB14_83
	callq	__ZdlPv
	jmp	LBB14_83
LBB14_96:
Ltmp163:
	movq	%rax, %rbx
LBB14_97:
	movq	-216(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB14_94
	callq	__ZdlPv
	jmp	LBB14_94
LBB14_99:
Ltmp164:
	movq	%rax, %rbx
LBB14_100:
	movq	-248(%rbp), %r14
	movq	-240(%rbp), %r15
	cmpq	%r15, %r14
	je	LBB14_105
	.align	4, 0x90
LBB14_101:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB14_103
	callq	__ZdlPv
LBB14_103:
	addq	$24, %r14
	cmpq	%r14, %r15
	jne	LBB14_101
	movq	-248(%rbp), %r14
LBB14_105:
	testq	%r14, %r14
	je	LBB14_97
	movq	%r14, %rdi
	callq	__ZdlPv
	jmp	LBB14_97
Leh_func_end14:
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table14:
Lexception14:
	.byte	255
	.byte	155
	.byte	159
	.byte	129
	.space	1
	.byte	3
	.byte	156
	.byte	1
Lset129 = Leh_func_begin14-Leh_func_begin14
	.long	Lset129
Lset130 = Ltmp140-Leh_func_begin14
	.long	Lset130
	.long	0
	.byte	0
Lset131 = Ltmp140-Leh_func_begin14
	.long	Lset131
Lset132 = Ltmp141-Ltmp140
	.long	Lset132
Lset133 = Ltmp162-Leh_func_begin14
	.long	Lset133
	.byte	0
Lset134 = Ltmp142-Leh_func_begin14
	.long	Lset134
Lset135 = Ltmp143-Ltmp142
	.long	Lset135
Lset136 = Ltmp163-Leh_func_begin14
	.long	Lset136
	.byte	0
Lset137 = Ltmp144-Leh_func_begin14
	.long	Lset137
Lset138 = Ltmp145-Ltmp144
	.long	Lset138
Lset139 = Ltmp164-Leh_func_begin14
	.long	Lset139
	.byte	0
Lset140 = Ltmp146-Leh_func_begin14
	.long	Lset140
Lset141 = Ltmp147-Ltmp146
	.long	Lset141
Lset142 = Ltmp170-Leh_func_begin14
	.long	Lset142
	.byte	0
Lset143 = Ltmp148-Leh_func_begin14
	.long	Lset143
Lset144 = Ltmp149-Ltmp148
	.long	Lset144
Lset145 = Ltmp168-Leh_func_begin14
	.long	Lset145
	.byte	0
Lset146 = Ltmp150-Leh_func_begin14
	.long	Lset146
Lset147 = Ltmp153-Ltmp150
	.long	Lset147
Lset148 = Ltmp169-Leh_func_begin14
	.long	Lset148
	.byte	0
Lset149 = Ltmp154-Leh_func_begin14
	.long	Lset149
Lset150 = Ltmp155-Ltmp154
	.long	Lset150
Lset151 = Ltmp166-Leh_func_begin14
	.long	Lset151
	.byte	0
Lset152 = Ltmp156-Leh_func_begin14
	.long	Lset152
Lset153 = Ltmp157-Ltmp156
	.long	Lset153
Lset154 = Ltmp167-Leh_func_begin14
	.long	Lset154
	.byte	0
Lset155 = Ltmp158-Leh_func_begin14
	.long	Lset155
Lset156 = Ltmp159-Ltmp158
	.long	Lset156
Lset157 = Ltmp165-Leh_func_begin14
	.long	Lset157
	.byte	0
Lset158 = Ltmp160-Leh_func_begin14
	.long	Lset158
Lset159 = Ltmp161-Ltmp160
	.long	Lset159
Lset160 = Ltmp169-Leh_func_begin14
	.long	Lset160
	.byte	0
Lset161 = Ltmp161-Leh_func_begin14
	.long	Lset161
Lset162 = Leh_func_end14-Ltmp161
	.long	Lset162
	.long	0
	.byte	0
	.align	2

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	 "vector::_M_fill_insert"

L_.str1:
	.asciz	 "VaR = %.16f\n"

	.section	__TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame0:
Lsection_eh_frame:
Leh_frame_common:
Lset163 = Leh_frame_common_end-Leh_frame_common_begin
	.long	Lset163
Leh_frame_common_begin:
	.long	0
	.byte	1
	.asciz	 "zPLR"
	.byte	1
	.byte	120
	.byte	16
	.byte	7
	.byte	155
	.long	___gxx_personality_v0@GOTPCREL+4
	.byte	16
	.byte	16
	.byte	12
	.byte	7
	.byte	8
	.byte	144
	.byte	1
	.align	3
Leh_frame_common_end:
	.globl	__Z11initialSeedm.eh
__Z11initialSeedm.eh:
Lset164 = Leh_frame_end1-Leh_frame_begin1
	.long	Lset164
Leh_frame_begin1:
Lset165 = Leh_frame_begin1-Leh_frame_common
	.long	Lset165
Ltmp174:
	.quad	Leh_func_begin1-Ltmp174
Lset166 = Leh_func_end1-Leh_func_begin1
	.quad	Lset166
	.byte	8
	.quad	0
	.byte	4
Lset167 = Ltmp0-Leh_func_begin1
	.long	Lset167
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset168 = Ltmp1-Ltmp0
	.long	Lset168
	.byte	13
	.byte	6
	.align	3
Leh_frame_end1:

	.globl	__Z13doubleComparePKvS0_.eh
__Z13doubleComparePKvS0_.eh:
Lset169 = Leh_frame_end2-Leh_frame_begin2
	.long	Lset169
Leh_frame_begin2:
Lset170 = Leh_frame_begin2-Leh_frame_common
	.long	Lset170
Ltmp175:
	.quad	Leh_func_begin2-Ltmp175
Lset171 = Leh_func_end2-Leh_func_begin2
	.quad	Lset171
	.byte	8
	.quad	0
	.byte	4
Lset172 = Ltmp2-Leh_func_begin2
	.long	Lset172
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset173 = Ltmp3-Ltmp2
	.long	Lset173
	.byte	13
	.byte	6
	.align	3
Leh_frame_end2:

	.globl	__ZSt26__uninitialized_fill_n_auxIPSt6vectorIdSaIdEEmS2_EvT_T0_RKT1_St12__false_type.eh
.weak_definition __ZSt26__uninitialized_fill_n_auxIPSt6vectorIdSaIdEEmS2_EvT_T0_RKT1_St12__false_type.eh
__ZSt26__uninitialized_fill_n_auxIPSt6vectorIdSaIdEEmS2_EvT_T0_RKT1_St12__false_type.eh:
Lset174 = Leh_frame_end3-Leh_frame_begin3
	.long	Lset174
Leh_frame_begin3:
Lset175 = Leh_frame_begin3-Leh_frame_common
	.long	Lset175
Ltmp176:
	.quad	Leh_func_begin3-Ltmp176
Lset176 = Leh_func_end3-Leh_func_begin3
	.quad	Lset176
	.byte	8
Ltmp177:
	.quad	Lexception3-Ltmp177
	.byte	4
Lset177 = Ltmp22-Leh_func_begin3
	.long	Lset177
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset178 = Ltmp23-Ltmp22
	.long	Lset178
	.byte	13
	.byte	6
	.byte	4
Lset179 = Ltmp24-Ltmp23
	.long	Lset179
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end3:

	.globl	__ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type.eh
.weak_definition __ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type.eh
__ZSt24__uninitialized_copy_auxIPSt6vectorIdSaIdEES3_ET0_T_S5_S4_St12__false_type.eh:
Lset180 = Leh_frame_end4-Leh_frame_begin4
	.long	Lset180
Leh_frame_begin4:
Lset181 = Leh_frame_begin4-Leh_frame_common
	.long	Lset181
Ltmp178:
	.quad	Leh_func_begin4-Ltmp178
Lset182 = Leh_func_end4-Leh_func_begin4
	.quad	Lset182
	.byte	8
Ltmp179:
	.quad	Lexception4-Ltmp179
	.byte	4
Lset183 = Ltmp43-Leh_func_begin4
	.long	Lset183
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset184 = Ltmp44-Ltmp43
	.long	Lset184
	.byte	13
	.byte	6
	.byte	4
Lset185 = Ltmp45-Ltmp44
	.long	Lset185
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end4:

	.globl	__ZNSt6vectorIdSaIdEEaSERKS1_.eh
.weak_definition __ZNSt6vectorIdSaIdEEaSERKS1_.eh
__ZNSt6vectorIdSaIdEEaSERKS1_.eh:
Lset186 = Leh_frame_end5-Leh_frame_begin5
	.long	Lset186
Leh_frame_begin5:
Lset187 = Leh_frame_begin5-Leh_frame_common
	.long	Lset187
Ltmp180:
	.quad	Leh_func_begin5-Ltmp180
Lset188 = Leh_func_end5-Leh_func_begin5
	.quad	Lset188
	.byte	8
	.quad	0
	.byte	4
Lset189 = Ltmp46-Leh_func_begin5
	.long	Lset189
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset190 = Ltmp47-Ltmp46
	.long	Lset190
	.byte	13
	.byte	6
	.byte	4
Lset191 = Ltmp48-Ltmp47
	.long	Lset191
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end5:

	.globl	__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd.eh
.weak_definition __ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd.eh
__ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEmRKd.eh:
Lset192 = Leh_frame_end6-Leh_frame_begin6
	.long	Lset192
Leh_frame_begin6:
Lset193 = Leh_frame_begin6-Leh_frame_common
	.long	Lset193
Ltmp181:
	.quad	Leh_func_begin6-Ltmp181
Lset194 = Leh_func_end6-Leh_func_begin6
	.quad	Lset194
	.byte	8
	.quad	0
	.byte	4
Lset195 = Ltmp49-Leh_func_begin6
	.long	Lset195
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset196 = Ltmp50-Ltmp49
	.long	Lset196
	.byte	13
	.byte	6
	.byte	4
Lset197 = Ltmp51-Ltmp50
	.long	Lset197
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end6:

	.globl	__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_.eh
.weak_definition __ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_.eh
__ZNSt6vectorIS_IdSaIdEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_.eh:
Lset198 = Leh_frame_end7-Leh_frame_begin7
	.long	Lset198
Leh_frame_begin7:
Lset199 = Leh_frame_begin7-Leh_frame_common
	.long	Lset199
Ltmp182:
	.quad	Leh_func_begin7-Ltmp182
Lset200 = Leh_func_end7-Leh_func_begin7
	.quad	Lset200
	.byte	8
Ltmp183:
	.quad	Lexception7-Ltmp183
	.byte	4
Lset201 = Ltmp90-Leh_func_begin7
	.long	Lset201
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset202 = Ltmp91-Ltmp90
	.long	Lset202
	.byte	13
	.byte	6
	.byte	4
Lset203 = Ltmp92-Ltmp91
	.long	Lset203
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end7:

	.globl	__Z20computeCholeskyTransRKSt6vectorIS_IdSaIdEESaIS1_EERS3_.eh
__Z20computeCholeskyTransRKSt6vectorIS_IdSaIdEESaIS1_EERS3_.eh:
Lset204 = Leh_frame_end8-Leh_frame_begin8
	.long	Lset204
Leh_frame_begin8:
Lset205 = Leh_frame_begin8-Leh_frame_common
	.long	Lset205
Ltmp184:
	.quad	Leh_func_begin8-Ltmp184
Lset206 = Leh_func_end8-Leh_func_begin8
	.quad	Lset206
	.byte	8
Ltmp185:
	.quad	Lexception8-Ltmp185
	.byte	4
Lset207 = Ltmp96-Leh_func_begin8
	.long	Lset207
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset208 = Ltmp97-Ltmp96
	.long	Lset208
	.byte	13
	.byte	6
	.byte	4
Lset209 = Ltmp98-Ltmp97
	.long	Lset209
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end8:

	.globl	__Z10multMatMatRKSt6vectorIS_IdSaIdEESaIS1_EES5_RS3_.eh
__Z10multMatMatRKSt6vectorIS_IdSaIdEESaIS1_EES5_RS3_.eh:
Lset210 = Leh_frame_end9-Leh_frame_begin9
	.long	Lset210
Leh_frame_begin9:
Lset211 = Leh_frame_begin9-Leh_frame_common
	.long	Lset211
Ltmp186:
	.quad	Leh_func_begin9-Ltmp186
Lset212 = Leh_func_end9-Leh_func_begin9
	.quad	Lset212
	.byte	8
Ltmp187:
	.quad	Lexception9-Ltmp187
	.byte	4
Lset213 = Ltmp102-Leh_func_begin9
	.long	Lset213
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset214 = Ltmp103-Ltmp102
	.long	Lset214
	.byte	13
	.byte	6
	.byte	4
Lset215 = Ltmp104-Ltmp103
	.long	Lset215
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end9:

	.globl	__Z5transRKSt6vectorIS_IdSaIdEESaIS1_EERS3_.eh
__Z5transRKSt6vectorIS_IdSaIdEESaIS1_EERS3_.eh:
Lset216 = Leh_frame_end10-Leh_frame_begin10
	.long	Lset216
Leh_frame_begin10:
Lset217 = Leh_frame_begin10-Leh_frame_common
	.long	Lset217
Ltmp188:
	.quad	Leh_func_begin10-Ltmp188
Lset218 = Leh_func_end10-Leh_func_begin10
	.quad	Lset218
	.byte	8
Ltmp189:
	.quad	Lexception10-Ltmp189
	.byte	4
Lset219 = Ltmp108-Leh_func_begin10
	.long	Lset219
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset220 = Ltmp109-Ltmp108
	.long	Lset220
	.byte	13
	.byte	6
	.byte	4
Lset221 = Ltmp110-Ltmp109
	.long	Lset221
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end10:

	.globl	__Z17randomCorrelationmRSt6vectorIS_IdSaIdEESaIS1_EERj.eh
__Z17randomCorrelationmRSt6vectorIS_IdSaIdEESaIS1_EERj.eh:
Lset222 = Leh_frame_end11-Leh_frame_begin11
	.long	Lset222
Leh_frame_begin11:
Lset223 = Leh_frame_begin11-Leh_frame_common
	.long	Lset223
Ltmp190:
	.quad	Leh_func_begin11-Ltmp190
Lset224 = Leh_func_end11-Leh_func_begin11
	.quad	Lset224
	.byte	8
Ltmp191:
	.quad	Lexception11-Ltmp191
	.byte	4
Lset225 = Ltmp122-Leh_func_begin11
	.long	Lset225
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset226 = Ltmp123-Ltmp122
	.long	Lset226
	.byte	13
	.byte	6
	.byte	4
Lset227 = Ltmp124-Ltmp123
	.long	Lset227
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end11:

	.globl	__Z8runTrialmmddRKSt6vectorIS_IdSaIdEESaIS1_EERKS1_.eh
.weak_definition __Z8runTrialmmddRKSt6vectorIS_IdSaIdEESaIS1_EERKS1_.eh
__Z8runTrialmmddRKSt6vectorIS_IdSaIdEESaIS1_EERKS1_.eh:
Lset228 = Leh_frame_end12-Leh_frame_begin12
	.long	Lset228
Leh_frame_begin12:
Lset229 = Leh_frame_begin12-Leh_frame_common
	.long	Lset229
Ltmp192:
	.quad	Leh_func_begin12-Ltmp192
Lset230 = Leh_func_end12-Leh_func_begin12
	.quad	Lset230
	.byte	8
Ltmp193:
	.quad	Lexception12-Ltmp193
	.byte	4
Lset231 = Ltmp134-Leh_func_begin12
	.long	Lset231
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset232 = Ltmp135-Ltmp134
	.long	Lset232
	.byte	13
	.byte	6
	.byte	4
Lset233 = Ltmp136-Ltmp135
	.long	Lset233
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end12:

	.globl	__Z11threadEntryPv.eh
__Z11threadEntryPv.eh:
Lset234 = Leh_frame_end13-Leh_frame_begin13
	.long	Lset234
Leh_frame_begin13:
Lset235 = Leh_frame_begin13-Leh_frame_common
	.long	Lset235
Ltmp194:
	.quad	Leh_func_begin13-Ltmp194
Lset236 = Leh_func_end13-Leh_func_begin13
	.quad	Lset236
	.byte	8
	.quad	0
	.byte	4
Lset237 = Ltmp137-Leh_func_begin13
	.long	Lset237
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset238 = Ltmp138-Ltmp137
	.long	Lset238
	.byte	13
	.byte	6
	.byte	4
Lset239 = Ltmp139-Ltmp138
	.long	Lset239
	.byte	131
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end13:

	.globl	_main.eh
_main.eh:
Lset240 = Leh_frame_end14-Leh_frame_begin14
	.long	Lset240
Leh_frame_begin14:
Lset241 = Leh_frame_begin14-Leh_frame_common
	.long	Lset241
Ltmp195:
	.quad	Leh_func_begin14-Ltmp195
Lset242 = Leh_func_end14-Leh_func_begin14
	.quad	Lset242
	.byte	8
Ltmp196:
	.quad	Lexception14-Ltmp196
	.byte	4
Lset243 = Ltmp171-Leh_func_begin14
	.long	Lset243
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset244 = Ltmp172-Ltmp171
	.long	Lset244
	.byte	13
	.byte	6
	.byte	4
Lset245 = Ltmp173-Ltmp172
	.long	Lset245
	.byte	131
	.byte	7
	.byte	140
	.byte	6
	.byte	141
	.byte	5
	.byte	142
	.byte	4
	.byte	143
	.byte	3
	.align	3
Leh_frame_end14:


.subsections_via_symbols
