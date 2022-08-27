.text

#Incremet the array elements by 10  

#load base address of array by load word
la $s0,arr
#load address of size by load word
la $s1,size
#load value of address, load the data, the size ,the actual number
lw $s1,0($s1)
#prepare i for looping
add $t0,$zero,$zero
#prepare 10 to be used in mult as register
add $s2,$zero,10
Loop1:
#set t1 if i is less than size, else t1=0
slt $t1,$t0,$s1
#if t1 is 1, i.e. i<size, branch to Loop2
bne $t1,$zero,Loop2
#if t1 is 0,i.e. i>=size, branch to Print
beq $t1,$zero,Print

Loop2:
#shift left i by 2,i.e. multiply it by 4 as there is a relation ship between the array index and the offset needed to access the memory since we are "word",i.e. 4 bytes
sll $t3,$t0,2
#add offset to base address, to not change base address as I may need it in other more complex programs
add $t3,$t3,$s0
#now we have the address, let us load the data of that address
lw $t2,0($t3)
#now let us do the math operation required
#mult consider overflow
mult $t2,$s2
#move from $low
mfhi $t4
#move from $hi
mflo $t5
#add hi and low to get the final answer
add $t2,$t4,$t5
#now we have modified data ,let us store it
sw $t2,0($t3)
#increment i to loop
addi $t0,$t0,1
#jump back to Loop1
j Loop1

#Print the array elements
Print:
#this is how we print a string
li $v0, 4
la $a0, string
syscall
#set i=0 for looping
add $t0,$zero,$zero

Print1:
#set t1 if i is less than size, else t1=0
slt $t1,$t0,$s1
#if t1 is 1, i.e. i<size, branch to Print2
bne $t1,$zero,Print2
#if t1 is 0,i.e. i>=size, branch to End
beq $t1,$zero,End

Print2:
#shift left i by 2,i.e. multiply it by 4 as there is a relation ship between the array index and the offset needed to access the memory since we are "word",i.e. 4 bytes
sll $t3,$t0,2
#add offset to base address, to not change base address as I may need it in other more complex programs
add $t3,$t3,$s0
#now we have the address, let us load the data of that address
lw $t2,0($t3)
#this is how to print a string
li $v0, 4
la $a0, space
syscall
#this is how to print a number
li $v0, 1
add $a0, $t2,$zero
syscall
#increment i to loop
addi $t0,$t0,1
j Print1

End:

.data
arr: .word 1,2,3,4,5,6,7
size: .word 7
string: .asciiz "The array is after modification : "
space: .asciiz "  "