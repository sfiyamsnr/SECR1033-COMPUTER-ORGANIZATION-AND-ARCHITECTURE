INCLUDE Irvine32.inc

.data
header BYTE "Calculate Perimeter 2-Hexagon (LOOP and ADD instructions) :", 0Dh, 0Ah, 0
newline BYTE 0Dh, 0Ah, 0
prompt1 BYTE "Input Hexagon 1 (side length): ", 0
prompt2 BYTE "Input Hexagon 2 (side length): ", 0
msgResult BYTE "Result of Perimeter Hexagon 1 and 2:", 0Dh, 0Ah, 0
sideHex1 DWORD ?
sideHex2 DWORD ?
Perimeter_hexagon1 DWORD ?
Perimeter_hexagon2 DWORD ?

.code
main PROC
; Print header
mov edx, OFFSET header
call WriteString
call Crlf

; Print newline
mov edx, OFFSET newline
call WriteString

; Prompt for first hexagon side length
mov edx, OFFSET prompt1
call WriteString
call ReadInt
mov sideHex1, eax

; Prompt for second hexagon side length
mov edx, OFFSET prompt2
call WriteString
call ReadInt
mov sideHex2, eax

; Print newline
mov edx, OFFSET newline
call WriteString

; Calculate perimeter of the first hexagon
mov ecx, 6; Loop counter
mov eax, sideHex1; Load side length into eax
mov ebx, 0; Initialize perimeter to 0

calc_perimeter1:
add ebx, eax; Add side length to perimeter
loop calc_perimeter1; Repeat 6 times

mov Perimeter_hexagon1, ebx; Store result in Perimeter_hexagon1

; Calculate perimeter of the second hexagon
mov ecx, 6; Loop counter
mov eax, sideHex2; Load side length into eax
mov ebx, 0; Initialize perimeter to 0

calc_perimeter2:
add ebx, eax; Add side length to perimeter
loop calc_perimeter2; Repeat 6 times

mov Perimeter_hexagon2, ebx; Store result in Perimeter_hexagon2

; Display results
mov edx, OFFSET msgResult
call WriteString
call Crlf

; Display Perimeter_hexagon1
mov eax, Perimeter_hexagon1
call WriteDec
call Crlf

; Display Perimeter_hexagon2 
mov eax, Perimeter_hexagon2
call WriteDec
call Crlf

; Print newline
mov edx, OFFSET newline
call WriteString

exit
main ENDP

END main