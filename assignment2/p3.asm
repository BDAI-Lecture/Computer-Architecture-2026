.data
buffer:
    .space 100
msg_prompt:
    .asciiz "Enter string: "
msg_result:
    .asciiz "Reverse string: "
newline:
    .asciiz "\n"


.text
.globl main


main:
    # print prompt
    li $v0, 4
    la $a0, msg_prompt
    syscall

    # get user input (string)
    li $v0, 8
    la $a0, buffer
    li $a1, 100
    syscall

    la   $t0, buffer

scan:
    lb   $t1, 0($t0)
    beq  $t1, $zero, ready
    nop
    addi $t0, $t0, 1
    j    scan
    nop

ready:
    la   $t2, buffer
    subu $t3, $t0, $t2
    move $a0, $t2

    addi $t0, $t0, -1
    bne  $t0, $t2, emit
    nop
    lw   $t5, -1($t0)

emit:
    li   $v0, 4
    la   $a0, msg_result
    syscall

    li   $t6, 8          

print_rev:
    lb   $a0, 0($t0) 
    li   $v0, 11
    syscall
    addi $t0, $t0, -1

    blt  $t0, $t2, finish
    nop

    addi $t6, $t6, -1
    bgtz $t6, print_rev
    nop

    lb   $t7, 0($a0) 

finish:
    li $v0, 4
    la $a0, newline
    syscall

    # exit program
    li $v0, 10
    syscall