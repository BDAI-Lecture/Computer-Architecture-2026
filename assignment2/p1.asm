.data
msg_prompt:
    .asciiz "Enter n (positive integer): "
msg_result:
    .asciiz "Fibonacci Result: "
msg_error:
    .asciiz "Error: received negative integer\n"
newline:
    .asciiz "\n"


.text
.globl main

main:
    # user input
    li $v0, 4
    la $a0, msg_prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0       # $a0 = n

    # go to fibonacci label
    jal fibonacci
    move $s0, $v0       # save result

    # print result
    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall


error:
    li $v0, 4
    la $a0, msg_error
    syscall
    
    # exit program
    li $v0, 10
    syscall


fibonacci:
########################################
############Implement here##############
# Implement Fibonacci
#
# Constraints:
# - You must implement ONLY TWO labels in total:
#   (1) 'fibonacci' (already given)
#   (2) ONE additional label of your choice
# - Do NOT add any other labels.
# - Write ALL your code ONLY inside this block.
# - Do NOT modify code outside this region.
# - Add meaningful comments explaining your logic
########################################

