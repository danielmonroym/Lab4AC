.text
   main:
  lw $a2, 0($zero)
  lw $t2, 48($zero)
  lw $t1,52($zero)
 lw $s3,56($zero)
 lw $s6,60($zero)
  lw $s0,64($zero)
  lw $s1,68($zero)
   lw $s4, 72($zero)
  lw $s5, 76($zero)
  lw $s2, 80($zero)
    lw $s7, 84($zero)
  lw $a1, 88($zero) 
  lw $a0,  92($zero) 
  lw $a3, 96($zero) 
  jal procedimiento
  
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
lw $t6,0($zero)
slt $t7, $t4, $t6
beq $t7,1, menoresImpares 
beq $t7,0,mayoresImpares
iteracion:
add $a2, $a2,$a0
#add $t2,$t2,$a0
j continuar

calcularIndPares:
lw $t4,0($a2) 
lw $t6,0($zero)
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