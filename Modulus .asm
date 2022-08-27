.text

la $s0,array
la $s1,arrayModulus
la $s2,size
lw $s2,0($s2)
la $s3,number
lw $s3,0($s3)

add $t0,$zero,$zero

L1:
slt $t1,$t0,$s2
bne $t1,$zero,L2
beq $t1,$zero,LPrint

L2:
sll $t1,$t0,2
add $t2,$t1,$s0
add $t3,$t1,$s1
lw $t4,0($t2)
div $t4,$s3
mfhi $t4
sw $t4,0($t3)
addi $t0,$t0,1
j L1

LPrint:

li $v0,4
la $a0,string1
syscall

add $t0,$zero,$zero

LPrint1:
slt $t1,$t0,$s2
bne $t1,$zero,LPrint2
beq $t1,$zero,LModPrint

LPrint2:
sll $t1,$t0,2
add $t1,$t1,$s0
lw $t2,0($t1)

li $v0,1
add $a0,$t2,$zero
syscall

li $v0,4
la $a0,string3
syscall

addi $t0,$t0,1
j LPrint1


LModPrint:

li $v0,4
la $a0,string2
syscall

add $t0,$zero,$zero

LModPrint1:
slt $t1,$t0,$s2
bne $t1,$zero,LModPrint2
beq $t1,$zero,LEnd

LModPrint2:
sll $t1,$t0,2
add $t1,$t1,$s1
lw $t2,0($t1)

li $v0,1
add $a0,$t2,$zero
syscall

li $v0,4
la $a0,string3
syscall

addi $t0,$t0,1
j LModPrint1


LEnd:


.data
array: .word 1,2,3,4,8,16,24,25,26,27,28,29,30,0,122
arrayModulus: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
size: .word 15
number: .word 8
string1: .asciiz "The array before modulus :\n"
string2: .asciiz "\nThe array after modulus :\n"
string3: .asciiz "    "
