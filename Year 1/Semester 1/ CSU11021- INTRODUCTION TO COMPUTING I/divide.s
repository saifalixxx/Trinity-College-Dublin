  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  @ Write an ARM Assembly Language Program that will divide a
 
  MOV R5, #0                        @ Initialisation of counter

While :                             @ while (a >= b)
  CMP R2, R3                        @ {
  BLO EndWhile                      
  SUB R2, R2, R3                    @ a = a - b
  ADD R5, R5, #1                    @ x = x + 1 [Counter]
   B While                          @ }     

EndWhile :                          @ Storing results
  MOV R1, R2                        @ remainder result = a
  MOV R0, R5                        @ quotient result = b

End_Main:
  BX    lr

.end
