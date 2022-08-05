  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  @ Write an ARM Assembly Language Program that will convert
  @ e.g. '2', '0', '3', '4' (or 0x32, 0x30, 0x33, 0x34) to 2034 (0x7F2)

  MOV R5, #1                          @ [Initialisation] x = 1
  MOV R6, #10                         @ y = 10
  MOV R7, #100                        @ z = 100
  MOV R8, #1000                       @ n = 1000

  SUB R1, R1, #0x30                   @ [Takeaway 0x30 to get single digit] value - 0x30
  SUB R2, R2, #0x30                   @ value2 - 0x30
  SUB R3, R3, #0x30                   @ value3 - 0x30
  SUB R4, R4, #0x30                   @ value4 - 0x30

  MUL R5, R1, R5                      @ [Multiply 1,10,100,1000] x = value * x
  MUL R6, R2, R6                      @ y = value2 * y   
  MUL R7, R3, R7                      @ z = value3 * z
  MUL R8, R4, R8                      @ n = value4 * n

  ADD R10, R5, R6                     @ [Sum up numbers] w = x + y
  ADD R11, R7, R8                     @ p = z + n

  ADD R0, R10, R11                    @ [Combination] result = w + p

  



End_Main:
  BX    lr

.end
