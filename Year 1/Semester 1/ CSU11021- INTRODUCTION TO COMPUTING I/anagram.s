.syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:
  LDR R10, =0                                
  LDR R0, =0                       @ result = 0            
  LDR R5, =' '                     
 LDRB R3, [R1]                     @ A = [address A]
 LDRB R4, [R2]                     @ B = [address B]

While :                            @ while(A != 0 && B !=0) {
  CMP R3, #0           
  BEQ StringNull
  CMP R4, #0
  BEQ StringNull
  CMP R3, #'a'                     @ if (A >= 'a' && A <= 'z')
  BLO NotNull
  CMP R3, #'z'           
  BHI NotNull 
  SUB R3, R3, #32                  @ A = A - 0x20
  STRB R3, [R1]                    @ [address 1] = A
                                   @ }
NotNull :
  CMP R4, #'a'                     @ if (B >= 'a' && B <= 'z')
  BLO IfNull
  CMP R4, #'z'
  BHI IfNull
  SUB R4, R4, #32                  @ B = B - 0x20
  STRB R4, [R2]                    @ [address 2] = B

IfNull :
  ADD R6, R6, #1                   @ B = B + 1
  ADD R7, R7, #1                   @ A = A + 1
  ADD R2, R2, #1                   @ B = B + 1
  ADD R1, R1, #1                   @ A = A + 1
  LDRB R3, [R1]
  LDRB R4, [R2]
   B  While

StringNull :                       @ if (A != 0 || B != 0) {
  CMP R3, #0                       
  BNE End_Main                 
  CMP R4, #0
  BNE End_Main
  SUB R2, R2, R6                   @ B = addressB - characterB
  SUB R1, R1, R7                   @ A = addressA - characterA
  LDRB R3, [R1]
  LDRB R4, [R2]                    @ }

IfWhile :
  CMP R3, #0                       @ while (char != 0) {
  BEQ IfEqual
  LDR R8, =0
  LDR R9, =0                       @ }

NotWhile :
  CMP R4, #0                       @ for (C = 0) {
  BEQ NotEqual                     
  CMP R8, #1                       
  BEQ NotEqual
  CMP R3, R4
  BNE NotEqual1
  MOV R8, #1
  STRB R5, [R2]
  ADD R10, R10, #1                 @ }

NotEqual1 :
  ADD R2, #1                  
  LDRB R4, [R2]
  ADD R9, #1
   B  NotWhile

NotEqual :
  SUB R2, R2, R9
  LDRB R4, [R2]
  ADD R1, R1, #1
  LDRB R3, [R1]
    B IfWhile

IfEqual :
  CMP R10, R7                      
  BNE End_Main
  ADD R0, R0, #1                  // result stored in R0



End_Main:
  BX    lr