  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  @   ax^2 + bx + c for given values of a, b, c and x

  MUL R8, R1, R1            @ Calculation of ax^2 x * x = x^2
  MUL R8, R2, R8            @ a * x^2 = ax^2        

  MUL R9, R3, R1            @ Calculation of bx b * x = bx

  ADD R0, R8, R9            @ ax^2 + bx
  ADD R0, R0, R4            @ ax^2 + bx + c
  
  





End_Main:
  BX    lr

.end
