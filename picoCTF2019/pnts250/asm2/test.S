asm2(0xc,0x15) 

														esp
															+ 0 戻りアドレス 
															+ 4 0xc
															+ 8 0x15

asm2:
	<+0>:	push   ebp								esp <- ebp, esp = esp + 4
	<+1>:	mov    ebp,esp							ebp <- esp

														ebp
															+ 0 ... (ebpの退避)
															+ 4 ... 戻りアドレス 
															+ 8 0xc
															+ c 0x15

	<+3>:	sub    esp,0x10							esp <- esp - 16
	<+6>:	mov    eax,DWORD PTR [ebp+0xc]			eax <- *(ebp + 0xc)
														eax 0x15
	<+9>:	mov    DWORD PTR [ebp-0x4],eax			*(ebp - 0x4) <- eax
														ebp
															- 4 0x15  
															+ 0 ... (ebpの退避)
															+ 4 ... 戻りアドレス 
															+ 8 0xc
															+ c 0x15

	<+12>:	mov    eax,DWORD PTR [ebp+0x8]			eax <- *(ebp + 0x8)
														eax 0xc

	<+15>:	mov    DWORD PTR [ebp-0x8],eax			*(ebp - 0x8) <- eax

															- 8 0x0c 
															- 4 0x15  
															+ 0 ... (ebpの退避)
															+ 4 ... 戻りアドレス 
															+ 8 0x0c
															+ c 0x15

	<+18>:	jmp    0x50c <asm2+31>					goto <31>
	<+20>:	add    DWORD PTR [ebp-0x4],0x1			*(ebp - 0x4) += 1
	<+24>:	add    DWORD PTR [ebp-0x8],0xaf			*(ebp - 0x8) += 0xaf   (175)
	<+31>:	cmp    DWORD PTR [ebp-0x8],0xa3d3		*(ebp - 0x8) と 0xa3d3 (41939) を比較
	<+38>:	jle    0x501 <asm2+20>					小さければ <20> に分岐
	<+40>:	mov    eax,DWORD PTR [ebp-0x4]			eax <- *(ebp - 0x4) 
	<+43>:	leave  
	<+44>:	ret    

