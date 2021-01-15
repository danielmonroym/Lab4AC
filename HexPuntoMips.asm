.text
   main:
  lw $a2, 0($zero)  # se cargan los datos del vector en memoria
  lw $t2, 48($zero) #Declaran variables y espacio en memoria a usar
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
  jal procedimiento # Se salta al  procedimiento donde se encuentran los menores y mayores de cada �ndice(par e impar)
    add $t3,$zero,$zero # se resetea t3 en cero
  jal repetidosMenores    # procedimiento donde se calculan cu�ntas veces que est�n los menores pares e impares
    # El resultado queda guardado en t8 y t9
    add $t8, $zero, $v0
    add $t9, $zero, $v1
    #Resetreo de variables        
    add $t3,$zero,$zero
    add $v0, $zero, $zero
    add $v1, $zero, $zero
    jal repetidosMayores  # procedimiento donde se calculan cu�ntas veces  est�n los mayores pares e impares
      # El resultado queda guardado en t6 y t7
     add $t6, $zero, $v0
    add $t7, $zero, $v1
  
  procedimiento:
add $t6,$t6, $zero # Se carga con cero t6, vairable con la que se recorre el vector para mirar si el �ndice es par o impar
lw $t4,0($a2) # Se carga con cero t6, vairable con la que se recorre el vector para mirar si el �ndice es par o impar
and $t3, $t6, 1 # se usa un and para mirar si t6 es par o impar
beq $t3,1, calcularIndImpares  # si es impar salta
beq $t3,0,calcularIndPares # si es par salta
continuar:
        add $t5,$t5,$a3 # se suma uno a t5, variable que maneja las veces que se repite el procedimiento
        add $t6,$t6,$a3 # Se suma 1 a t6, vairable con la que se recorre el vector para mirar si el �ndice es par o impar
        bne  $t5,10,procedimiento # si no se han recorrido todos los indices se devuelve a iterar
        jr $ra # se devuelve al rograma prinicpal
        
calcularIndImpares:
lw $t4,0($a2)  # se carga el primer valor del vector
lw $t8,0($zero)  # se carga un cero en t8
slt $t7, $t4, $t8 # si t4 es menor que cero es porque es un candidato a ser el menor si no es un candidato a ser el mayor
beq $t7,1, menoresImpares  # si t7 es uno salta
beq $t7,0,mayoresImpares # si t7 es cero salta
iteracion:
add $a2, $a2,$a0 #a�ade 4 a la posici�n en memoria del vector
#add $t2,$t2,$a0
j continuar # se devuelve a seguir iterando

calcularIndPares:
lw $t4,0($a2) # se carga el primer valor del vector
lw $t8,0($zero) # se carga un cero en t8
slt $t7, $t4, $t8 # si t4 es menor que cero es porque es un candidato a ser el menor si no es un candidato a ser el mayor
beq $t7,1, menoresPares   # si t7 es uno salta
beq $t7,0,mayoresPares # si t7 es cero salta
iteracion2:
add $a2, $a2,$a0 #a�ade 4 a la posici�n en memoria del vector

#add $t1,$t1,$a0
j continuar


menoresImpares:
sw $t4,($t1) #se guarda el n�mero en t1
lw $t8,($t1) #se carga el n�mero en t8
lw $t7,-4($t1) # se carga el valor en memoria anterior para comparar
slt $t3,$t8,$t7 # si t8 es menor que t7 entonces es el nuevo menor
beq $t3,1, guardarMenorImpar #salta si t3 es 1
contadorMemoria:
add $t1,$t1,$a0 # a�ade 4 a la posici�n en memoria 


j iteracion

mayoresImpares:
sw $t4,($s3) #se guarda el n�mero en  s3
lw $t8,($s3) #se carga el n�mero en t8
lw $t7,-4($s3) # se carga el valor en memoria anterior para comparar
slt $t3,$t8,$t7 # si t8 es mayor que t7 entonces es el nuevo mayor
beq $t3,0, guardarMayorImpar #salta si t3 es 0
contadorMemoria3:
add $t1,$t1,$a0 # a�ade 4 a la posici�n en memoria 
j iteracion  # se devuelve a seguir iterando

menoresPares:
sw $t4,($t2) #se guarda el n�mero en t2
lw $t9,($t2) #se carga el n�mero en t9
lw $t7,-4($t2)  # se carga el valor en memoria anterior para comparar
slt $t3,$t9,$t7 # si t9 es menor que t7 entonces es el nuevo menor
beq $t3,1, guardarMenorPar  #salta si t3 es 1
contadorMemoria2:
add $t2,$t2,$a0 # a�ade 4 a la posici�n en memoria
j iteracion # se devuelve a seguir iterando


mayoresPares:
sw $t4,($s6) #se carga el n�mero en s6
lw $t9,($s6) #se carga el n�mero en t9
lw $t7,-4($s6) # se carga el valor en memoria anterior para comparar
slt $t3,$t9,$t7 # si t9 es mayor que t7 entonces es el nuevo mayor
beq $t3,0, guardarMayorPar  #salta si t3 es 0
contadorMemoria4:
add $t2,$t2,$a0 # a�ade 4 a la posici�n en memoria
j iteracion # se devuelve a seguir iterando

guardarMenorImpar:
sw $t8, 0($s1) # Guarda el valor en t8 en s1
j contadorMemoria # salta a seguir sumando en memoria

guardarMenorPar:
sw $t9, 0($s0) # Guarda el valor en t9 en s0
j contadorMemoria2  # salta a seguir sumando en memoria

guardarMayorImpar:
sw $t8, 0($s5) # Guarda el valor en t8 en s5
j contadorMemoria3  # salta a seguir sumando en memoria

guardarMayorPar:
sw $t9, 0($s4) # Guarda el valor en t9 en s4
j contadorMemoria4  # salta a seguir sumando en memoria

repetidosMenores:
add $t3,$t3,$a3 # se suma 1 a t3, el cual manejar� las repeticiones
lw $t0, 0($s0) # se carga el menor par
lw $t5, 0($s1) # se carga el menor impar
lw $t4, 0($s2) # se carga el primer dato del vector
beq $t0,$t4, contadorRepeticionesMenorPar # salta si el menor par es igual al valor en esa posicion del vector
beq $t5,$t4, contadorRepeticionesMenorImpar # salta si el menor impar es igual al valor en esa posicion del vector
loop:
add $s2, $s2,$a0 # se suma 4 a la posici�n de memoria del vector
beq $t3,10,devolverse # cuando t3 sea igual a la cantidad de valores en el vector termina de recorrer
j repetidosMenores # se devuelve a seguir iterando
devolverse:
jr $ra  #se devuelve al programa principal

repetidosMayores:
add $t3,$t3,$a3 # se suma 1 a t3, el cual manejar� las repeticiones
lw $t0, 0($s4) # se carga el mayor par
lw $t5, 0($s5) # se carga el mayor impar
lw $t4, 0($s7)  # se carga el primer dato del vector
beq $t0,$t4, contadorRepeticionesMayorPar # salta si el mayor par es igual al valor en esa posicion del vector
beq $t5,$t4, contadorRepeticionesMayorImpar # salta si el mayor impar es igual al valor en esa posicion del vector
loop2:
add $s7, $s7,$a0 # se suma 4 a la posici�n de memoria del vector
beq $t3,10,devolverse2 # cuando t3 sea igual a la cantidad de valores en el vector termina de recorrer
j repetidosMayores # se devuelve a seguir iterando
devolverse2:
jr $ra # se devuelve al programa principal

contadorRepeticionesMenorPar:
add $v0,$v0,$a3 # Cuenta las repeticiones del menor par
j loop # se devuelve a seguir iterando

contadorRepeticionesMenorImpar:
add $v1,$v1,$a3 # Cuenta las repeticiones del menor impar
j loop # se devuelve a seguir iterando

contadorRepeticionesMayorPar:
add $v0,$v0,$a3 # Cuenta las repeticiones del mayor par
j loop2 # se devuelve a seguir iterando

contadorRepeticionesMayorImpar:
add $v1,$v1,$a3 # Cuenta las repeticiones del mayor impar
j loop2 #se devuelve a seguir iterando
