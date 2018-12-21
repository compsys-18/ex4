      .text
main:
      addi  $sp, $sp, -12
      sw    $ra, 0($sp)
      sw    $s0, 4($sp)
      sw    $s1, 8($sp)

      li    $s0, 0
      li    $s1, 0
loop:
      jal   read1bit

      add   $s0, $s0, $s0
      add   $s0, $s0, $v0
      addi  $s1, $s1, 1
      blt   $s1, 8, loop

      move  $a0, $s0
      li    $v0, 1
      syscall

      lw    $ra, 0($sp)
      lw    $s0, 4($sp)
      lw    $s1, 8($sp)
      addi  $sp, $sp, 12
      jr    $ra

read1bit:
      li    $v0, 5
      syscall
      jr    $ra
