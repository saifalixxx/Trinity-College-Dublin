  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  
  .global  get9x9
  .global  set9x9
  .global  average9x9
  .global  blur9x9


Main:
  BL get9x9
  BL set9x9
  BL average9x9
  BL blur9x9

  
get9x9:
  PUSH {R5, R6, R7, LR}            @ Push registers from R5-R7             
  MOV R5, R0                       @ x = original array
  LDR R6, = 9                      @ y = 9 (9x9 array)
  MUL R5, R1, R6                   @ x = 7 * y
  ADD R5, R5, R2                   @ x = x + 6
  LDR R7, [R0, R5, LSL #2]         @ address = [address + location]
  MOV R0 , R7                      @ original array = address
  POP {R5, R6, R7, PC}             @ Pop out registers from R5-R7              

set9x9:
  PUSH {R5, R6, LR}                @ Push registers from R5-R6
  MOV R5, #9                       @ x = 9 (9x9 array)
  MOV R6, R0                       @ y = original array           
  MUL R6, R1, R5                   @ y = 7 * x
  ADD R6, R6, R2                   @ y = y + 6                    
  STR R3, [R0, R6, LSL #2]         @ Store address = [address + location]
  POP {R5, R6, PC}                 @ Pop out registers from R5-R6          

average9x9:
  PUSH {R4-R12, LR}                @ Push registers from R4-R12
  MOV R5, R0                       @ x = original array
  MOV R6, #0                       @ Initialisation {
  MOV R7, #0                       
  MOV R8, #0                       
  MOV R9, #0                       
  MOV R10, #0
  MOV R11, #0
  MOV R12, #0                      @ }

  ADD R6, R1, R3                   @ y = 4 + 2

  CMP R6, #8                       @ y > 8
  BLS subAlike                     
  MOV R6, #8                       @ y = 8

subAlike :
  ADD R7, R2, R3                   @ z = 3 + 2

  CMP R7, #8                       @ z > 8
  BLS subEqual
  MOV R7, #8                       @ z = 8

subEqual :
  CMP R1, R3                       @ 4 < 3
  BHS subBigger
  MOV R8, #0                       @ n = 0
   B ifNotSub

subBigger :
  SUB R8, R1, R3                   @ n = 4 - 2

ifNotSub :
  CMP R2, R3                       @ 3 < 2
  BHS subGreater
  MOV R9, #0                       @ v = 0
   B ifSubNotAlike

subGreater :
  SUB R9, R2, R3                   @ v = 3 - 2

ifSubNotAlike :
  MOV R10, R9                      @ l = v

subLoop :
  CMP R8, R6                       @ n <= y
  BHI subLoop2
  MOV R9, R10                      @ v = l

subLoop3 :
  CMP R9, R7                       @ v <= z
  BHI subLoop4 
  MOV R2, R9                       @ 3 = v
  MOV R1, R8                       @ 4 = n
  MOV R0, R11                      @ original array = c

  BL get9x9                        @ Calling get9x9 function

  ADD R12, R12, R0                 @ h = h + original array
  ADD R4, R4, #1                   @ Increment
  ADD R9, R9, #1                   @ Increment
   B subLoop3

subLoop4 :
  ADD R8, R8, #1                   @ Increment
   B subLoop

subLoop2 :
  UDIV R0, R12, R4                 @ original array = h/e

  POP     {R4-R12, PC}                      

blur9x9:
  PUSH {R5-R9,LR}                  @ Push registers from R5-R9              

  MOV R5, R0                       @ x = original array   
  MOV R6, R1                       @ y = new array     
  MOV R7, R2                       @ z = 2
  MOV R8, #0                       @ l = 0

blurLoop1 :                          
  CMP R8, #9                       @ l < 9    
  BHS blurTerminate                
  MOV R9 , #0                      @ c = 0

blurLoop2 :                          
  CMP R9, #9                       @ c < 9        
  BHS blurTerminate2                  
  MOV R0, R5                       @ Original array = x   
  MOV R1, R8                       @ New array = l
  MOV R2, R9                       @ 2 = c
  MOV R3, R7                       @ k = z

  BL average9x9                    @ Calling average 9x9 function

  MOV R3, R0                       @ k = original array    
  MOV R1, R8                       @ New array = l  
  MOV R2, R9                       @ 2 = c     
  MOV R0, R6                       @ Original array = y

  BL set9x9                        @ Calling set9x9 function

  ADD R9, R9, #1                   @ Increment                  
   B blurLoop2  

blurTerminate2 :                       
  ADD R8, R8, #1                   @ Increment
   B blurLoop1       
                  
blurTerminate :   

  POP {R5-R9, PC}                  @ Pop out registers from R5 - R9                         

.end