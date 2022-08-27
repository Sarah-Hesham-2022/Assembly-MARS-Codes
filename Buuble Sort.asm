.text

la $s0,size
lw $s1,0($s0)
sub $s0,$s1,1


la $s2, array


#this is how to print a string
li $v0, 4
la $a0, string1
syscall

add $t0,$zero,$zero

Loop1:
slt $t1,$t0,$s1
bne $t1,$zero,Loop2
beq $t1,$zero,L0

Loop2:
sll $t2,$t0,2
add $t3,$t2,$s2
lw $t4,0($t3)
#this is how to print a number
li $v0, 1
add $a0, $t4,$zero
syscall
#this is how to print a string
li $v0, 4
la $a0, string3
syscall
addi $t0,$t0,1
j Loop1

L0:
addi $t0,$zero,-1


L1:
addi $t0,$t0,1
slt $t3,$t0,$s0
addi $t7,$zero,-1
sub $t1,$s0,$t0
bne $t3,$zero,L2
beq $t3,$zero,LPrint

L2:
add $t7,$t7,1
slt $t2,$t7,$t1
bne $t2,$zero ,L3
beq $t2,$zero,L1

L3:
sll $t2 ,$t7, 2
addi $t3,$t2,4
add $t2,$t2,$s2
lw $t4,0($t2)
add $t3,$t3,$s2
lw $t5,0($t3)
slt $t6,$t5,$t4
bne $t6,$zero,LSwap
beq $t6,$zero, L2

LSwap:
sw $t4,0($t3)
sw $t5,0($t2)
j L2

LPrint:
#this is how to print a string
li $v0, 4
la $a0, string2
syscall

add $t0,$zero,$zero

Loop3:
slt $t1,$t0,$s1
bne $t1,$zero,Loop4
beq $t1,$zero,End

Loop4:
sll $t2,$t0,2
add $t3,$t2,$s2
lw $t4,0($t3)
#this is how to print a number
li $v0, 1
add $a0, $t4,$zero
syscall
#this is how to print a string
li $v0, 4
la $a0, string3
syscall
addi $t0,$t0,1
j Loop3

End:


.data
array: .word 3,4,6,7,9,0,1,5,2,10,8,-100,100
size: .word 13
string1: .asciiz "The array before sort : \n"
string2 : .asciiz "\nThe array after sort : \n"
string3 : .asciiz "   "
