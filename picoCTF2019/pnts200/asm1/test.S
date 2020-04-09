asm1:
	<+0>:	push   ebp								« ebp -> sp+
	<+1>:	mov    ebp,esp							«  ebp <- esp
	<+3>:	cmp    DWORD PTR [ebp+0x8],0x35d		« *(ebp + 0x8) ‚ğ 0x35d ‚Æ”äŠr
	<+10>:	jg     0x512 <asm1+37>					« ‘å‚«‚¯‚ê‚Î <37> ‚Ö
	<+12>:	cmp    DWORD PTR [ebp+0x8],0x133		   ebp + 0x8 ‚ğ 0x133 ‚Æ”äŠr
	<+19>:	jne    0x50a <asm1+29>					   “™‚µ‚­‚È‚¯‚ê‚Î <29> ‚Ö
	<+21>:	mov    eax,DWORD PTR [ebp+0x8]			   ebp + 0x8 ‚ğ eax‚Ö
	<+24>:	add    eax,0xb							   eax <- eax + 0x8
	<+27>:	jmp    0x529 <asm1+60>					   +60‚Ö•ªŠò
	<+29>:	mov    eax,DWORD PTR [ebp+0x8]			   eax <- *(ebp + 0x8)
	<+32>:	sub    eax,0xb							   eax <- eax - 0x8
	<+35>:	jmp    0x529 <asm1+60>
	<+37>:	cmp    DWORD PTR [ebp+0x8],0x53e		« *(ebp+0x8) ‚ğ 0x53e‚Æ”äŠr
	<+44>:	jne    0x523 <asm1+54>					« ˆÙ‚È‚ê‚Î +54‚Ö
	<+46>:	mov    eax,DWORD PTR [ebp+0x8]			« eax <- *(ebp+0x8)
	<+49>:	sub    eax,0xb							« eax <- eax - 0xb
	<+52>:	jmp    0x529 <asm1+60>					« 0x60‚Ö
	<+54>:	mov    eax,DWORD PTR [ebp+0x8]
	<+57>:	add    eax,0xb                          « 
	<+60>:	pop    ebp								« ebp ‚ğ•œ‹A
	<+61>:	ret    

