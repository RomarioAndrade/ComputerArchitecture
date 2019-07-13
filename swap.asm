	;
	JMP inicio
VAR_A:
	DB 10

VAR_B:
	DB 35

inicio:	
	MOV B, [VAR_A]			;Coloca 10 em B e 35 em C
	MOV C, [VAR_B]
	CALL printf			;Chama rotina de impressão
	
	
	MOV B, [VAR_A]			;Coloca 10 em B e 35 em C
	MOV C, [VAR_B]
	
	PUSH B				;Coloca o valor de B na pilha
	MOV B, C			;Move o valor de C para B
	POP C				;Recupera o valor armazenado na pilha e
					;coloca em C
	CALL printf			;Chama rotina de impressão
	HLT


printf:	
	MOV D, 232
	MOV [D], 65				;Imprime a letra A
	INC D
	MOV [D], 61				;Imprime o caractere =
	INC D
	MOV A, B				;posiciona o valor a ser imprimido no registrador A

	CALL printfDezenas			;chamada para imprimir as dezenas de A
	CALL printfUnidades			;chamada para imprimir as unidade de A

	MOV [D], 66				;Imprime a letra B
	INC D
	MOV [D], 61				;Imprime o caractere =
	INC D

	MOV A, C				;coloca o segundo valor a ser imprimido em A
	MOV B, C				;posiciona o valor a ser imprimido em B

	CALL printfDezenas
	CALL printfUnidades
	RET

printfDezenas:
	DIV 10					;A ÷ 10	
	CALL printfA				;Imprime A
	RET

printfUnidades:
	MOV A, B				;Coloca o valor original em A novamente.
	DIV 10					;A/10  Divide o valor de A por 10.
	MUL 10					;A*10  Multiplica o valor de A por 10.
	SUB B, A				;B = B - A Subtrair A do valor original.
	MOV A, B				;Move B para A
	CALL printfA				;Imprime A
	RET

printfA:
	ADD A, 48				;A + deslocamento ASCII
	MOV [D], A				;Coloca A na saída
	MOV A, 0				;reseta o valor de A
	INC D 					;Incrementa a posição da memória
	RET

