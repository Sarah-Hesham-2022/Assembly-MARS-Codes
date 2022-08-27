.text

la $s0,array

la $s1,size
lw $s1,0($s1)

la $s2,index

la $s3,element
lw $s3,0($s3)

add $t0,$zero,$zero

addi $t9,$zero,0

Loop1:
slt $t1,$t0,$s1
bne $t1,$zero,Loop2
beq $t1,$zero,End

Loop2:
sll $t2,$t0,2
add $t2,$t2,$s0
lw $t3,0($t2)
sub $t3,$t3,$s3
beq $t3 ,$zero,Loop3
addi $t0,$t0,1
j Loop1

Loop3:
addi $t9,$zero,1
sw $t0,0($s2)
# Printing out the number
li $v0, 1
add $a0, $s3,$zero
syscall
# Printing out the text
li $v0, 4
la $a0, string
syscall
# Printing out the number
li $v0, 1
add $a0, $t0,$zero
syscall
# Printing out the text
li $v0, 4
la $a0, newline
syscall
addi $t0,$t0,1
j Loop1

End:
beq $t9,$zero,End2
bne $t9,$zero,End3

End2:
# Printing out the number
li $v0, 1
add $a0, $s3,$zero
syscall
# Printing out the text
li $v0, 4
la $a0, string
syscall
# Printing out the number
lw $t0,0($s2)
li $v0, 1
add $a0, $t0,$zero
syscall

End3:


.data
array: .word 1,2,3,4,5,6,7,8,8,8
size: .word 10
index: .word -1
element: .word 8
string: .asciiz "  element is found at index:  "
newline: .asciiz "\n"