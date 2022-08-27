.text

la $s0,array
la $s1,arrayMax
la $s2,arrayMin

la $s3,size
lw $s3,0($s3)

la $s4,max
lw $s5,0($s4)

la $s6,min
lw $s7,0($s6)

add $t0,$zero,$zero

L1:
slt $t1,$t0,$s3
bne $t1,$zero,L2
beq $t1,$zero,LMaxMin

L2:
sll $t1,$t0,2
add $t1,$t1,$s0
lw $t1,0($t1)
addi $t0,$t0,1
slt $t2,$t1,$s7
bne $t2,$zero,LSwapMin
beq $t2,$zero,LCheckMax

LSwapMin:
sw $t1,0($s6)
lw $s7,0($s6)
j L1

LCheckMax:
slt $t2,$t1,$s5
bne $t2,$zero,L1
beq $t2,$zero,LSwapMax

LSwapMax:
sw $t1,0($s4)
lw $s5,0($s4)
j L1



LMaxMin:

lw $s5,0($s4)
lw $s7,0($s6)
add $t0,$zero,$zero

LMaxMin1:
slt $t1,$t0,$s3
bne $t1,$zero,LMaxMin2
beq $t1,$zero,LPrint

LMaxMin2:
sll $t1,$t0,2
add $t6,$t1,$s0
add $t2,$t1,$s1
add $t3,$t1,$s2
lw  $t4,0($t6)
sub $t5,$s5,$t4
sw $t5,0($t2)
sub $t5,$t4,$s7
sw $t5,0($t3)
add $t0,$t0,1
j LMaxMin1

LPrint:

add $t0,$zero,$zero

li $v0,4
la $a0,string4
syscall

LPrint1:
slt $t1,$t0,$s3
bne $t1,$zero,LPrint2
beq $t1,$zero,LPrintMax

LPrint2:
sll $t1,$t0,2
add $t1,$t1,$s0
lw $t2,0($t1)

li $v0,1
add $a0,$zero,$t2
syscall
li $v0,4
la $a0,string3
syscall

addi $t0,$t0,1
j LPrint1

LPrintMax:

add $t0,$zero,$zero

li $v0,4
la $a0,string1
syscall

LPrintMax1:
slt $t1,$t0,$s3
bne $t1,$zero,LPrintMax2
beq $t1,$zero,LPrintMin

LPrintMax2:
sll $t1,$t0,2
add $t1,$t1,$s1
lw $t2,0($t1)

li $v0,1
add $a0,$zero,$t2
syscall
li $v0,4
la $a0,string3
syscall

addi $t0,$t0,1
j LPrintMax1

LPrintMin:

add $t0,$zero,$zero

li $v0,4
la $a0,string2
syscall

LPrintMin1:
slt $t1,$t0,$s3
bne $t1,$zero,LPrintMin2
beq $t1,$zero,LEnd

LPrintMin2:
sll $t1,$t0,2
add $t1,$t1,$s2
lw $t2,0($t1)

li $v0,1
add $a0,$zero,$t2
syscall
li $v0,4
la $a0,string3
syscall

addi $t0,$t0,1
j LPrintMin1

LEnd:



.data
array: .word 18,67,3,24,32
arrayMax: .word 0,0,0,0,0
arrayMin: .word 0,0,0,0,0
max: .word -1000000
min: .word  1000000
size: .word 5
string1: .asciiz "\nThe array of max minus the elements of the array : \n"
string2: .asciiz "\nThe array of elements minus min: \n"
string3: .asciiz "     "
string4: .asciiz "The original array: \n"