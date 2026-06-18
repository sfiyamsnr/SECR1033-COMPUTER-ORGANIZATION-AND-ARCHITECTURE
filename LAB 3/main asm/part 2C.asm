INCLUDE Irvine32.inc

.data
msgWelcome BYTE "Welcome to Simple Math Activities :", 0Dh, 0Ah, 0
menuPrompt BYTE "Main Menu :", 0Dh, 0Ah, 0
menuOption1 BYTE "1. To calculate Perimeter Hexagon (Loop and ADD instructions)", 0
menuOption2 BYTE "2. To calculate SUM (unsign int) index (Odd or Even) in an Array Hello [6]", 0Dh, 0Ah, 0
selectInput BYTE "Select Your Input : ", 0


continuePrompt BYTE "Press 'y' to Main Menu or 'n' to Exit the benchmark :", 0Dh, 0Ah, 0
thankYou BYTE "Thank you ... BYE !!", 0Dh, 0Ah, 0
invalidSelection BYTE "Invalid selection. Try again.", 0Dh, 0Ah, 0

; Option 1
header1 BYTE "Calculate Perimeter 2-Hexagon (LOOP and ADD instructions) :", 0Dh, 0Ah, 0
prompt1 BYTE "Input Hexagon 1 (side length) : ", 0
prompt2 BYTE "Input Hexagon 2 (side length) : ", 0
msgResult1 BYTE "Result of Perimeter Hexagon 1 and 2:", 0Dh, 0Ah, 0
sideHex1 DWORD ?
sideHex2 DWORD ?
Perimeter_hexagon1 DWORD ?
Perimeter_hexagon2 DWORD ?
TotalPerimeter DWORD ?

; Option 2
header2 BYTE "Calculate SUM (unsign INT) index (Odd or Even) in array Hello[6] :", 0Dh, 0Ah, 0
prompt3 BYTE "Interger Input : ", 0
msgResult2 BYTE "Result Sum Hello[index]:", 0Dh, 0Ah, 0
msgEven BYTE "Sum Hello[even] index location : ", 0
msgOdd BYTE "Sum Hello[odd] index location : ", 0
HELLO DWORD 6 DUP(0)
TotalEVEN DWORD 0
TotalODD DWORD 0
newline BYTE 0Dh, 0Ah, 0

.code
	main PROC
	call Clrscr
	mov edx, OFFSET msgWelcome
	call WriteString
	call Crlf
	mov edx, OFFSET menuPrompt
	call WriteString
	call Crlf
	mov edx, OFFSET menuOption1
	call WriteString
	call Crlf
	mov edx, OFFSET menuOption2
	call WriteString
	call Crlf

	mov edx, OFFSET selectInput
	call WriteString
	call ReadDec
	cmp eax, 1
	je periHex_loopAdd
	cmp eax, 2
	je calSum_oddeven
	jmp invalidInput


periHex_loopAdd :
	; Print header
	mov edx, OFFSET header1
	call WriteString
	call Crlf

	; First hexagon side length
	mov edx, OFFSET prompt1
	call WriteString
	call ReadInt
	mov sideHex1, eax

	; Second hexagon side length
	mov edx, OFFSET prompt2
	call WriteString
	call ReadInt
	mov sideHex2, eax

	; Calculate perimeter of the first hexagon
	mov ecx, 6
	mov eax, sideHex1
	mov ebx, 0

	calc_perimeter1:
	add ebx, eax
	loop calc_perimeter1
	mov Perimeter_hexagon1, ebx

	; Calculate perimeter of the second hexagon
	mov ecx, 6
	mov eax, sideHex2
	mov ebx, 0

	calc_perimeter2:
	add ebx, eax
	loop calc_perimeter2
	mov Perimeter_hexagon2, ebx

	; Display perimeter
	mov edx, OFFSET msgResult1
	call WriteString
	call Crlf
	mov eax, Perimeter_hexagon1
	call WriteDec
	call Crlf
	mov eax, Perimeter_hexagon2
	call WriteDec
	call Crlf

	; Print newline
	mov edx, OFFSET newline
	call WriteString

	jmp continueOrExit

calSum_oddeven :
	; Print header
	mov edx, OFFSET header2
	call WriteString
	call Crlf

	; Input 6 integers
	mov ecx, 6
	lea edi, HELLO

	input_loop :
	mov edx, OFFSET prompt3
	call WriteString
	call ReadInt
	mov[edi], eax
	add edi, 4
	loop input_loop

	; Calculate sum of even indexed values
	mov ecx, 3
	lea esi, HELLO
	xor eax, eax

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
	mov edx, OFFSET msgResult2
	call WriteString
	call Crlf
	mov edx, OFFSET msgEven
	call WriteString
	mov eax, TotalEVEN
	call WriteDec
	call Crlf
	mov edx, OFFSET msgOdd
	call WriteString
	mov eax, TotalODD
	call WriteDec
	call Crlf

	; Print newline
	mov edx, OFFSET newline
	call WriteString

	jmp continueOrExit

invalidInput :
	mov edx, OFFSET invalidSelection
	call WriteString
	call Crlf
	jmp main

continueOrExit :
	mov edx, OFFSET continuePrompt
	call WriteString
	call ReadChar
	cmp al, 'y'
	je main
	cmp al, 'n'
	je exitProgram
	jmp invalidInput

exitProgram :
	mov edx, OFFSET thankYou
	call WriteString
	call Crlf
	exit
	main ENDP

END main