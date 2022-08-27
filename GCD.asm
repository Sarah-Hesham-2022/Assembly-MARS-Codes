.text

la $v0,m
lw $s1,0($v0)

la $s2,n
lw $s3,0($s2)


L1:
beq $s3,$zero,L2
add $t1,$zero,$s3
div $s1,$s3
mfhi $t2
add $s3,$zero,$t2
add $s1,$zero,$t1
j L1

L2:
li $v0,1
add $a0,$s1,$zero
syscall













.data

m: .word  25
n: .word 100
GCD: .word 0
