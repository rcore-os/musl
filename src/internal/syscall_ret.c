#include <errno.h>
#include "syscall.h"

long __syscall_ret(unsigned long r)
{
	if (r > -4096UL) {
		errno = -r;
		return -1;
	}
	return r;
}

long rcore_syscall_entry __attribute__((section(".rodata"))) = 0xdeadbeaf;
