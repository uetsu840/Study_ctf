asm1:
	<+0>:	push   ebp								�� ebp -> sp+
	<+1>:	mov    ebp,esp							��  ebp <- esp
	<+3>:	cmp    DWORD PTR [ebp+0x8],0x35d		�� *(ebp + 0x8) �� 0x35d �Ɣ�r
	<+10>:	jg     0x512 <asm1+37>					�� �傫����� <37> ��
	<+12>:	cmp    DWORD PTR [ebp+0x8],0x133		   ebp + 0x8 �� 0x133 �Ɣ�r
	<+19>:	jne    0x50a <asm1+29>					   �������Ȃ���� <29> ��
	<+21>:	mov    eax,DWORD PTR [ebp+0x8]			   ebp + 0x8 �� eax��
	<+24>:	add    eax,0xb							   eax <- eax + 0x8
	<+27>:	jmp    0x529 <asm1+60>					   +60�֕���
	<+29>:	mov    eax,DWORD PTR [ebp+0x8]			   eax <- *(ebp + 0x8)
	<+32>:	sub    eax,0xb							   eax <- eax - 0x8
	<+35>:	jmp    0x529 <asm1+60>
	<+37>:	cmp    DWORD PTR [ebp+0x8],0x53e		�� *(ebp+0x8) �� 0x53e�Ɣ�r
	<+44>:	jne    0x523 <asm1+54>					�� �قȂ�� +54��
	<+46>:	mov    eax,DWORD PTR [ebp+0x8]			�� eax <- *(ebp+0x8)
	<+49>:	sub    eax,0xb							�� eax <- eax - 0xb
	<+52>:	jmp    0x529 <asm1+60>					�� 0x60��
	<+54>:	mov    eax,DWORD PTR [ebp+0x8]
	<+57>:	add    eax,0xb                          �� 
	<+60>:	pop    ebp								�� ebp �𕜋A
	<+61>:	ret    
