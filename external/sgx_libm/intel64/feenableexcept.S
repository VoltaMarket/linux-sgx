/*
* Math library
*
* Copyright (C) 2016 Intel Corporation. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above copyright
*     notice, this list of conditions and the following disclaimer in
*     the documentation and/or other materials provided with the
*     distribution.
*   * Neither the name of Intel Corporation nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
* OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
* LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
* THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*
* Author Name <jingwei.zhang@intel.com>
*   History:
*   03-14-2016 Initial version. numerics svn rev. 12864
*/
	.file "feenableexcept.c"
	.text
..TXTST0:
# -- Begin  feenableexcept
	.text
       .align    16,0x90
	.globl feenableexcept
feenableexcept:
# parameter 1: %edi
..B1.1:
	.cfi_startproc
..___tag_value_feenableexcept.1:
..L2:

        subq      $56, %rsp
	.cfi_def_cfa_offset 64
        movq      %fs:40, %rax
        andl      $63, %edi
        xorq      %rsp, %rax
        movq      %rax, 40(%rsp)
..B1.2:
        stmxcsr   4(%rsp)
..B1.3:
        testl     %edi, %edi
        je        ..B1.10
..B1.4:
        movl      %edi, %eax
        shll      $7, %eax
        notl      %eax
        andl      4(%rsp), %eax
        movl      %eax, (%rsp)
..B1.5:
        fnstenv   8(%rsp)
..B1.6:
        notl      %edi
        andw      %di, 8(%rsp)
..B1.7:
        fnclex    
..B1.8:
        fldenv    8(%rsp)
..B1.9:
        ldmxcsr   (%rsp)
..B1.10:
        movl      4(%rsp), %eax
        shrl      $7, %eax
        movq      40(%rsp), %rdx
        notl      %eax
        xorq      %rsp, %rdx
        andl      $63, %eax
        cmpq      %fs:40, %rdx
        jne       ..B1.12
..B1.11:
        addq      $56, %rsp
	.cfi_def_cfa_offset 8
        ret       
	.cfi_def_cfa_offset 64
..B1.12:
        call      __stack_chk_fail@PLT
        .align    16,0x90
	.cfi_endproc
	.type	feenableexcept,@function
	.size	feenableexcept,.-feenableexcept
	.data
# -- End  feenableexcept
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 1
# End
