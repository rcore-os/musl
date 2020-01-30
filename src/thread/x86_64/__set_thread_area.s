/* Copyright 2011-2012 Nicholas J. Kain, licensed under standard MIT license */
.text
.global __set_thread_area
.hidden __set_thread_area
.type __set_thread_area,@function
__set_thread_area:
	mov %rdi,%rsi           /* shift for syscall */
	movl $0x1002,%edi       /* SET_FS register */
	movl $158,%eax          /* set fs segment to */
	call __rcore_syscall                 /* arch_prctl(SET_FS, arg)*/
	ret

.global __rcore_syscall
.hidden __rcore_syscall
.type __rcore_syscall,@function
__rcore_syscall:
	jmp *rcore_syscall_entry(%rip)
	ret
