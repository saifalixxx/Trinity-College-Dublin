  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:
  MOV R5, #0                        // Initialisation {
  MOV R6, #0
  MOV R7, #0
  MOV R8, #0                       // }

StrLen :                          // Calculating string length
  LDRB R5, [R1]                    @ x = [address]
  CMP R5, #0                       @ x == 0
  BEQ EndStrLen
  ADD R1, #1                       @ word + 1
  ADD R6, #1                       @ y + 1
   B  StrLen

EndStrLen :
  SUB R1, R1, R6                   @ word = word - y

IfPal :
  LDRB R7, [R1]                    @ z = [address]
  CMP R6, #1                       @ z =< 1
  BLS EndPal
  CMP R7, #'A'                     @ z < 'A'
  BLO EndPalOne
  CMP R7, #'Z'                     @ z =< 'Z'
  BLS EndPalTwo
  CMP R7, #'a'                     @ z < 'a'
  BLO EndPalOne
  CMP R7, #'z'                     @ z > 'z'
  BHI EndPalOne

EndPalTwo :
  SUB R6, R6, #1                   @ y = y - 1
  ADD R1, R1, R6                   @ word = word + 1

NewPal :
  LDRB R8, [R1]                    @ k = [address]
  CMP R8, #'A'                     @ k < 'A'
  BLO ForPal
  CMP R8, #'Z'                     @ k =< 'Z'
  BLS JumpPal
  CMP R8, #'a'                     @ k < 'a'
  BLO ForPal
  CMP R8, #'z'                     @ k < 'z'
  BHI ForPal

JumpPal :
  BIC R7, R7, #0x20                @ z = z && 32
  BIC R8, R8, #0x20                @ k = k && 32
  CMP R7, R8                       @ z != k
  BNE NotPal
  CMP R6, #0                       @ y == 0
  BEQ EndPal                   
  SUB R6, R6, #1                   @ y = y - 1
  SUB R1, R1, R6                   @ x = x - 1
   B IfPal

EndPalOne :
  ADD R1, R1, #1                   @ word = word + 1
  SUB R6, R6, #1                   @ y = y - 1
   B  IfPal

ForPal :
  SUB R1, R1, #1                   @ word = word - 1
  SUB R6, R6, #1                   @ y = y - 1 
   B NewPal

EndPal :
  MOV R0, #1
   B ExitMain

NotPal :
  MOV R0, #0                       @ Store result n R0

ExitMain :

End_Main:
  BX    lr

