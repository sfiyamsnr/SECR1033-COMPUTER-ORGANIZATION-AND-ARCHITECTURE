INCLUDE Irvine32.inc

.data
header BYTE "Calculate SUM (unsign INT) index (Odd or Even) in array Hello[6] :", 0Dh, 0Ah, 0
newline BYTE 0Dh, 0Ah, 0
prompt BYTE "Integer Input : ", 0
msgResult BYTE "Result Sum Hello[index]:", 0Dh, 0Ah, 0
msgEven BYTE "Sum Hello[even] index location : ", 0
msgOdd BYTE "Sum Hello[odd] index location : ", 0
HELLO DWORD 6 DUP(0)
TotalEVEN DWORD 0
TotalODD DWORD 0

.code
main PROC
; Print header
mov edx, OFFSET header
call WriteString
call Crlf

; Input 6 integers
mov ecx, 6
lea edi, HELLO

input_loop :
mov edx, OFFSET prompt
call WriteString
call ReadInt
mov[edi], eax
add edi, 4
loop input_loop

; Calculate sum of even indexed values
mov ecx, 3
lea esi, HELLO
xor eax, eax
xor ebx, ebx

calc_even :
add eax, [esi]
add esi, 8
loop calc_even
mov TotalEVEN, eax

; Calculate sum of odd indexed values
mov ecx, 3
lea esi, HELLO
add esi, 4
xor eax, eax

calc_odd :
add eax, [esi]
add esi, 8
loop calc_odd
mov TotalODD, eax

; Display results
mov edx, OFFSET msgResult
call WriteString
call Crlf

; Print newline
mov edx, OFFSET newline
call WriteString

; Display TotalEVEN
mov edx, OFFSET msgEven
call WriteString
mov eax, TotalEVEN
call WriteDec
call Crlf

; Display TotalODD
mov edx, OFFSET msgOdd
call WriteString
mov eax, TotalODD
call WriteDec
call Crlf

exit
main ENDP

END main