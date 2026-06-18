include irvine32.inc

.data
var1 DWORD 5
var2 DWORD 10
var3 DWORD 20
var4 DWORD ?

.code
main proc
mov eax, var1; LINE1
mul var2; LINE2
add eax, var3; LINE3
dec eax; LINE4
exit
main endp
end main
