  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:
  MOV R4, #0                      @ Initialisation

  SUB R4, R1, R3                  @ alim = NA - NB

firstLoop :
  CMP R5, R4                      @ for(ra != 0)
  BGE EndFirstLoop         

secondLoop :
  CMP R6, R4                      @ for(ca != 0)
  BGT EndSecondLoop

thirdLoop :
  CMP R7, R3                      @ for( rb < arrB)
  BGT EndThirdLoop

fourthLoop :
  CMP R8, R3                      @ for (cb < arrB)
  BGE EndFourthLoop 
  MOV R9, #0                      @ Initialisation
  ADD R9, R5, R7                  @ element = ra + rb
  MUL R9, R9, R1                  @ element = element * start address
  ADD R9, R9, R6                  @ element = element + ca
  ADD R9, R9,  R8                 @ element = element + cb
  LDR R10, [R0, R9, LSL #2]       @ A
  MUL R9, R7, R3                  @ element = rb * arrB
  ADD R9, R8                      @ element + cb
  LDR R11, [R2, R9, LSL #2]       @ B
  ADD R8, R8, #1                  @ cb = cb + 1

  CMP R10, R11                    @ element A != element B
  BNE fourthLoop
  ADD R12, #1                     @ Increment 
  MUL R9, R3, R3                  @ element = arrB * arrB

  CMP R12, R9                     @ cb < NB
  BGE EndFirstLoop
   B fourthLoop

EndFourthLoop : 
  MOV R8, #0                      @ Reusing register
  ADD R7, #1                      @ Increment 
   B thirdLoop

EndThirdLoop :
  MOV R12, #0                     @ Reusing register
  MOV R7, #0                      @ Reusing register
  ADD R6, #1                      @ increment
   B secondLoop

EndSecondLoop :
  MOV R6, #0                      @ Reusing register
  ADD R5, #1                      @ increment 
   B firstLoop

EndFirstLoop :
  MUL R9, R3, R3                  @ element = arrB * arrB
  CMP R9, R12                     @ element ! = element B
  BNE ifNotSubArray
  MOV R0, #1                      @ result
   B End_Main

ifNotSubArray :
  MOV R0, #0                      @ result

End_Main:
  BX    lr

