prologue:
lis $4
.word 4
add $11, $0, $0
lis $22
.word readWord
lis $23
.word printHex

sw $31, -4($30)
sub $30, $30, $4

jalr $22
add $12, $3, $0

jalr $22
sub $11, $11, $4
jalr $22
sub $11, $11, $4
jalr $22
sub $11, $11, $4

add $11, $11, $3
add $5, $11, $0
add $6, $12, $0

FirstPrint:
jalr $22
sub $5, $5, $4
add $1, $3, $0

sw $1, 0($6)
add $6, $6, $4

jalr $23
beq $5, $0, AfterFirstPrint
beq $0, $0, FirstPrint

AfterFirstPrint:
add $5, $11, $0
add $6, $12, $0

Secondprinting:
lw $1, 0($6)
add $6, $6, $4
sub $5, $5, $4
jalr $23
beq $5, $0, epilogue
beq $0, $0, Secondprinting

epilogue:
add $30, $30, $4
lw $31, -4($30)
jr $31

readWord:
sw $1,  -4($30)
sw $2,  -8($30)
sw $4, -12($30)
sw $5, -16($30)
sw $6, -20($30)
sw $7, -24($30)
sw $8, -28($30)
lis $8
.word 28
sub $30, $30, $8
lis $4
.word 0x01000000
lis $3
.word 0x00010000
lis $2
.word 0x00000100
lis $1
.word 0xffff0004
lw $8, 0($1)
lw $7, 0($1)
lw $6, 0($1)
lw $5, 0($1)
multu $8, $4
mflo $8
multu $7, $3
mflo $7
multu $6, $2
mflo $6
add $4, $8, $7
add $3, $6, $5
add $3, $4, $3
lis $8
.word 28
add $30, $30, $8
lw $1,  -4($30)
lw $2,  -8($30)
lw $4, -12($30)
lw $5, -16($30)
lw $6, -20($30)
lw $7, -24($30)
lw $8, -28($30)
jr $31

printHex:
sw $1,  -4($30)
sw $2,  -8($30)
sw $3, -12($30)
sw $4, -16($30)
sw $5, -20($30)
sw $6, -24($30)
sw $7, -28($30)
sw $8, -32($30)
lis $8
.word 32
sub $30, $30, $8
lis $2
.word 0x10000000
lis $3
.word 0x10
lis $4
.word 0x30
lis $6
.word 10
lis $7
.word 7  
lis $8
.word 0xffff000c
PHloop:
divu $1, $2
mflo $1
slt $5, $1, $6 
bne $5, $0, PHskip
        add $1, $1, $7
PHskip: add $1, $1, $4 
sw $1, 0($8)
mfhi $1
divu $2, $3
mflo $2
bne $2, $0, PHloop
sw $6, 0($8)
lis $8
.word 32
add $30, $30, $8
lw $1,  -4($30)
lw $2,  -8($30)
lw $3, -12($30)
lw $4, -16($30)
lw $5, -20($30)
lw $6, -24($30)
lw $7, -28($30)
lw $8, -32($30)
jr $31