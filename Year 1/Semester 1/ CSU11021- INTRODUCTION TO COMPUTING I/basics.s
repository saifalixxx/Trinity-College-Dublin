  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  @   x^3 - 4x^2 + 3x + 8
                              
  MUL R5, R1, R1                @ Calculation of x^3  x * x = x^2
  MUL R5, R1, R5                @ x^2 * x = x^3

  LDR R2, = 4                   @ Calculation of 4x^2
  MUL R6, R1, R1                @ x * x = x^2
  MUL R6, R2, R6                @ 4 * x^2 = 4x^2

  LDR R3, = 3                   @ Calculation of 3x
  MUL R7, R3, R1                @ 3 * x = 3x

  LDR R4, = 8                   @
  
  SUB R5, R5, R6                @ x^3 - 4x^2
  ADD R7, R7, R4                @ 3x + 8

  ADD R0, R5, R7                @ x^3 - 4x^2 + 3x + 8



End_Main:
  BX    lr

.end
