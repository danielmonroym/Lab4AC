.data
   #El programa debe tomar un vector de cien números enteros que contiene valores entre -100 y
#100, y determinar cuáles son el mayor y el menor número almacenados entre los elementos de
# índice par e impar, y cuántas veces se repite cada uno. 
Vector:	.word 97,86, -30,-35,-92,86,-98,-99,97,-99
NumMenorImpar: .space 1000
NumMenorPar: .space 1000
MenorPar: .space 100
MenorImpar: .space 100
MayorPar: .space 100
MayorImpar: .space 100
NumMayorPar: .space 10000
NumMayorImpar: .space 10000
   cinco: .word 5
   uno: .word 1
   cuatro: .word 4
   cien: .word 100
   cero: .word 0   
.text
   main:
  la $a2, Vector
  la $t2,NumMenorImpar
  la $t1,NumMenorPar
 la $s3,NumMayorImpar
 la $s6,NumMayorPar
  la $s0, MenorPar
  la $s1, MenorImpar
   la $s4, MayorPar
  la $s5, MayorImpar
  la $s2, Vector
    la $s7, Vector
  lw $a1, cien 
  lw $a0, cuatro
  lw $a3, uno

    jal procedimiento
       add $t3,$zero,$zero
    jal repetidosMenores
    move $t8, $v0
    move $t9, $v1
    add $t3,$zero,$zero
    add $v0, $zero, $zero
    add $v1, $zero, $zero
    jal repetidosMayores
    move $t6, $v0
    move $t7, $v1
     li $v0,10
     syscall 
 
      
 
procedimiento:
add $t6,$t6, $zero
lw $t4,0($a2)
and $t3, $t4, 1
beq $t3,1, calcularIndImpares
beq $t3,0,calcularIndPares
continuar:
        add $t5,$t5,$a3
        add $t6,$t6,$a3
        bne  $t5,10,procedimiento
        jr $ra
        
calcularIndImpares:
lw $t4,0($a2) 
lw $t6,cero
slt $t7, $t4, $t6
beq $t7,1, menoresImpares 
beq $t7,0,mayoresImpares
iteracion:
add $a2, $a2,$a0
#add $t2,$t2,$a0
j continuar

calcularIndPares:
lw $t4,0($a2) 
lw $t6,cero
slt $t7, $t4, $t6
beq $t7,1, menoresPares 
beq $t7,0,mayoresPares
iteracion2:
add $a2, $a2,$a0

#add $t1,$t1,$a0
j continuar


menoresImpares:
sw $t4,($t1)
lw $t8,($t1)
lw $t7,-4($t1)
slt $t3,$t8,$t7
beq $t3,1, guardarMenorImpar
contadorMemoria:
add $t1,$t1,$a0


j iteracion

mayoresImpares:
sw $t4,($s3)
lw $t8,($s3)
lw $t7,-4($s3)
slt $t3,$t8,$t7
beq $t3,0, guardarMayorImpar
contadorMemoria3:
add $t1,$t1,$a0
j iteracion

menoresPares:
sw $t4,($t2)
lw $t9,($t2)
lw $t7,-4($t2)
slt $t3,$t9,$t7
beq $t3,1, guardarMenorPar
contadorMemoria2:
add $t2,$t2,$a0
j iteracion


mayoresPares:
sw $t4,($s6)
lw $t9,($s6)
lw $t7,-4($s6)
slt $t3,$t9,$t7
beq $t3,0, guardarMayorPar
contadorMemoria4:
add $t2,$t2,$a0
j iteracion

guardarMenorImpar:
sw $t8, 0($s1)
j contadorMemoria

guardarMenorPar:
sw $t9, 0($s0)
j contadorMemoria2

guardarMayorImpar:
sw $t8, 0($s5)
j contadorMemoria3

guardarMayorPar:
sw $t9, 0($s4)
j contadorMemoria4

repetidosMenores:
add $t3,$t3,$a3
lw $t0, 0($s0)
lw $t5, 0($s1)
lw $t4, 0($s2)
beq $t0,$t4, contadorRepeticionesMenorPar
beq $t5,$t4, contadorRepeticionesMenorImpar
loop:
add $s2, $s2,$a0
beq $t3,10,devolverse
j repetidosMenores
devolverse:
jr $ra

repetidosMayores:
add $t3,$t3,$a3
lw $t0, 0($s4)
lw $t5, 0($s5)
lw $t4, 0($s7)
beq $t0,$t4, contadorRepeticionesMayorPar
beq $t5,$t4, contadorRepeticionesMayorImpar
loop2:
add $s7, $s7,$a0
beq $t3,10,devolverse2
j repetidosMayores
devolverse2:
jr $ra

contadorRepeticionesMenorPar:
add $v0,$v0,$a3
j loop

contadorRepeticionesMenorImpar:
add $v1,$v1,$a3
j loop

contadorRepeticionesMayorPar:
add $v0,$v0,$a3
j loop2

contadorRepeticionesMayorImpar:
add $v1,$v1,$a3
j loop2


     
     
        
