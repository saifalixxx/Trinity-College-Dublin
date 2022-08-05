  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:
  MOV R5, #-1                @ Input -1 into register

OperationLoop :
  LDRB R7, [R1], #1          @ address [count++]

  CMP R7, #0x00              @ x != 0
  BEQ EndOperationLoop

  CMP R7, #0x30              @ x < 0x30
  BLO AddOperation

  CMP R7, #0x39              @ x > 0x39
  BHI AddOperation

  SUB R7, R7, #0x30          @ x = x - 0x39

OperationLoop2 :
  CMP R7, #0x20              @ x != 0x20
  BEQ GapOperation

GapOperation :
  PUSH {R7}                  @ Push

AddOperation :
  CMP R7, #0x2B              @ x == 0x2B
  BNE SubtractOperation
  POP {R7, R8}               @ Pop x & y
  ADD R7, R7, R8             @ x = x + y
  PUSH {R7}                  @ Push x

SubtractOperation :
  CMP R7, 0x2D              @ x == 0x2D
  BNE MultipleOperation     
  POP {R7, R9}              @ Pop x & z
  SUB R7, R7, R9            @ x = x - z
  MUL R7, R7, R5            @ x = x * -1
  PUSH {R7}                 @ Push x

MultipleOperation :
  CMP R7, #0x2A             @ Push x == 0x2A
  BNE ExitOperation         
  POP {R7, R10}             @ Pop x & p
  MUL R7, R7, R10           @ x = x * p
  PUSH {R7}                 @ Push x

ExitOperation :
  CMP R7, #0x25             @ x = 0x25
  BNE ExitOperationLoop 
  POP {R7, R11}             @ Pop x & n
  SUB R7, R7, R11           @ x = x - n
  PUSH {R7}                 @ Push x

ExitOperationLoop :         @ Loop back
   B OperationLoop
   B OperationLoop2
  
EndOperationLoop :
POP {R0}                   @ Pop result






  @
  @ You can use either
  @
  @   The System stack (R13/SP) with PUSH and POP operations
  @
  @   or
  @
  @   A user stack (R12 has been initialised for this purpose)
  @



End_Main:
  BX    lr

