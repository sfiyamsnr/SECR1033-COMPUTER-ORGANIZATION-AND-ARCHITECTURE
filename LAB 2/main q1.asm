INCLUDE Irvine32.inc
.data
var1 word	1
var2 word 9


.code
main PROC
mov ax, var1; LINE1
mov bx, var2; LINE2
xchg ax, bx; LINE3
mov var1, ax; LINE4
mov var2, bx; LINE5
call DumpRegs
exit
main ENDP
END main