      .data
cnt:
      .asciiz "What is number of the array?-"
array:
      .asciiz "type elements of the array.\n"
sum:
      .asciiz " is the sum."

      .text
main:
      addi  $sp, $sp, -8
      sw    $ra, 0($sp)
      sw    $s0, 4($sp)

      li    $s0, 0

      li    $v0, 4
      la    $a0, cnt
      syscall

      li    $v0, 5
      syscall
      move  $s0, $v0

      li    $v0, 4
      la    $a0, array
      syscall

      move  $a0, $s0
      jal   create_array

      move  $a0, $v0
      move  $a1, $s0
      jal   calc_sum
      move  $s0, $v0

      li    $v0, 1
      move  $a0, $s0
      syscall

      li    $v0, 4
      la    $a0, sum
      syscall

      lw    $s0, 4($sp)
      lw    $ra, 0($sp)
      addi  $sp, $sp, 8
      jr    $ra

create_array:
      addi  $sp, $sp, -12
      sw    $s0, 0($sp)
      sw    $s1, 4($sp)

      move  $s0, $a0

      li    $v0, 9
      add   $a0, $a0, $a0
      add   $a0, $a0, $a0
      syscall
      move  $s1, $v0

      sw    $v0, 8($sp)
loopa:
      li    $v0, 5
      syscall
      sw    $v0, 0($s1)

      addi  $s1, $s1, 4
      addi  $s0, $s0, -1
      blt   $zero, $s0, loopa

      lw    $v0, 8($sp)
      lw    $s1, 4($sp)
      lw    $s0, 0($sp)
      addi  $sp, $sp, 12
      jr    $ra

calc_sum:
      addi  $sp, $sp, -8
      sw    $s0, 0($sp)
      sw    $s1, 4($sp)

      li    $s0, 0
      li    $s1, 0
loopb:
      lw    $s0, 0($a0)
      add   $s1, $s1, $s0
      addi  $a0, $a0, 4
      addi  $a1, $a1, -1
      blt   $zero, $a1, loopb

      move  $v0, $s1
      lw    $s1, 4($sp)
      lw    $s0, 0($sp)
      addi  $sp, $sp, 8
      jr    $ra
