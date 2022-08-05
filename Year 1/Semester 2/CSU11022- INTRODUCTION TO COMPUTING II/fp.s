  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  
  .global   fp_exp
  .global   fp_frac
  .global   fp_enc




fp_exp:
  PUSH    {R9-R10, LR}                   @ Push all registers from R9 to R10   

  MOV R9, R0                             @ x = IEEE−754 number
  LDR R10, = 0x7F800000                  @ Load y = 0x7F800000  
  AND R9, R9, R10                        @ x = x + y (&&)
  MOV R9, R9, LSR #23                    @ x = x logical shift right by 23
  SUB R0, R9, #127                       @ IEEE−754 number = x + 127

  POP     {R9-R10, PC}                   @ Pop all registers from R9 to R10             
  
fp_frac:
  PUSH    {R5-R10, LR}                   @ Push all registers from R5 to R10

  MOV R7, #1                             @ x = 1       
  MOV R5, R0                             @ y = IEEE−754 number
  MOV R8, R0                             @ z = IEEE−754 number
  LDR R10, = 0                           @ n = 0

fractionSub :
  MOVS R5, R5, LSL R7                    @ y = y logical shift left x
  BCC closeFractionSub
  ADD R10, R10, #1                       @ p = p + 1

closeFractionSub :
  LDR R6, = 0x7FFFFF                     @ Load l = 0x7FFFFF
  AND R8, R8, R6                         @ z = z + l (&&)
  LDR R9, = 0x800000                     @ Load j = 0x800000  
  ORR R8, R8, R9                         @ z = z + j(||)

FractionNegative :
  CMP R10, #1                            @ if(p == 1) {
  BNE NotFractionNegative            
  NEG R8, R8                             @ negate z 

NotFractionNegative :
  MOV R0, R8                             @ IEEE−754 number = z

  POP     {R5-R10, PC}                   @ Pop all registers from R5 to R10          

fp_enc:
  PUSH    {R3-R10, LR}                   @ Push all registers from R3 to R10

  MOV R10, #8                            @ x = 8
  MOV R3, R0                             @ y = fraction
  MOV R4, R1                             @ z = exponent
  MOV R7, #0                             @ n = 0

  CMP R3, #0                             @ negative clear y and 0
  BPL encNegative 
  LDR R7, = 0x80000000                   @ n = 0x80000000 
  NEG R3, R3                             @ Negate y

encNegative :
  CLZ R5, R3                             @ clear leading zero l and y

  CMP R5, R10                            @ l != x
  BEQ encEqual

  CMP R5, R10                            @ l <= x
  BGT encBigger
  RSB R5, R5, R10                        @ Reverse subtraction l = l - x
  MOV R3, R3, LSR R5                     @ y = y logical shift right l              
  ADD R4, R5                             @ z + l
   B encEqual

encBigger :
  SUB R5, R5, R10                        @ l = l - x
  MOV R3, R3, LSL R5                     @ y = y logical shift left l
  SUB R4, R5                             @ z - l

encEqual :
  LDR R8, = 0x00800000                   @ Load j = 0x00800000    
  BIC R3, R3, R8                         @ bit clear y and j
  ADD R4, #127                           @ z + 127
  MOV R4, R4, LSL #23                    @ z = z logical shift left 23
  ADD R9, R3, R4                         @ k = y + z
  ADD R6, R9, R7                         @ a = k + n
  MOV R0, R6                             @ fraction = a
  
  POP     {R3-R10, PC}                   @ Pop all registers from R3 to R10       

.end