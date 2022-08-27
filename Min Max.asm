.text

# s0 has base index
la $s0,array

# s1 has size value
la $s1,size
lw $s1,0($s1)

# t0 is i for looping 
add $t0,$zero,$zero

# s2 has min address
la $s2,min
# t1 has min value
lw $t1,0($s2)

# s3 has max address
la $s3,max
# t4 has max value
lw $t4,0($s3)

# s4 has minIndex address
la $s4,minIndex

# s5 has maxIndex address
la $s5,maxIndex

Loop1:
slt $t5,$t0,$s1
bne $t5,$zero, Loop2
beq $t5,$zero,Print

Loop2:
sll $t5,$t0,2
add $t6,$t5,$s0
lw $t7,0($t6)
slt $t8,$t7,$t1
bne $t8,$zero,setMin
beq $t8,$zero,checkMax

setMin:
sw $t7,0($s2)
sw $t0,0($s4) 
sub $t1,$t1,$t1
add $t1,$t1,$t7
addi $t0,$t0,1
j Loop1

checkMax:
slt $t9,$t4,$t7
bne $t9,$zero,setMax
addi $t0,$t0,1
beq $t9,$zero,Loop1

setMax:
sw $t7,0($s3)
sw $t0,0($s5)
sub $t4,$t4,$t4
add $t4,$t4,$t7
addi $t0,$t0,1
j Loop1



Print:
#this is how to print a string
li $v0, 4
la $a0, string
syscall
# t0 is i for looping 
add $t0,$zero,$zero

Print1:
slt $t5,$t0,$s1
bne $t5,$zero, Print2
beq $t5,$zero,PrintEnd

Print2:
sll $t5,$t0,2
add $t6,$t5,$s0
lw $t7,0($t6)
#this is how to print a number
li $v0, 1
add $a0, $t7,$zero
syscall
#this is how to print a string
li $v0, 4
la $a0, space
syscall
addi $t0,$t0,1
j Print1

PrintEnd:
# Min
#this is how to print a string
li $v0, 4
la $a0, minString
syscall
# Printing out the number
li $v0, 1
add $a0, $t1,$zero
syscall
#this is how to print a string
li $v0, 4
la $a0,indexString
syscall
# Printing out the number
li $v0, 1
lw $t1,0($s4)
add $a0, $t1,$zero
syscall
# Max 
#this is how to print a string
li $v0, 4
la $a0, maxString
syscall
# Printing out the number
li $v0, 1
add $a0, $t4,$zero
syscall
#this is how to print a string
li $v0, 4
la $a0,indexString
syscall
# Printing out the number
li $v0, 1
lw $t1,0($s5)
add $a0, $t1,$zero
syscall

.data
array: .word 1,2,3,44,-1,-2,-99,0,4,5,55,8
size: .word 12
min: .word 10000
minIndex: .word -1
max: .word -10000
maxIndex: .word -1
space: .asciiz "  "
maxString: .asciiz "\nThe max element is   "
minString: .asciiz "\nThe min element is   "
indexString: .asciiz " ,found at index  "
string: .asciiz "The array : \n"
