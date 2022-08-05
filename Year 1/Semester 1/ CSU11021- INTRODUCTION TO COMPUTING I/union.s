.syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:
  LDR R3, [R1]                 @ x = [addressA]
  ADD R1, R1, #4               @ address A = address A + 4
                     
  LDR R9, [R2]                 @ y = [address B]     
  ADD R2, R2, #4               @ address B = address B + 4
  MOV R8, #0                   // Initalisation {
  MOV R4, #0                   
  MOV R11, #0                 
  MOV R6, #0                   @ }

  ADD R6, R6, R0               
  ADD R0, R0, #4              

WhileOne :                 
  CMP R4, R3                   @ While (l != size)
  BEQ EndWhileOne              
  LDR R11, [R1]                @ A = [address A]         
  STR R11, [R0]                @ A = [address C]
  ADD R8, R8, #1               // Push to location 1 onwards       
  ADD R1, R1, #4                  
  ADD R0, R0, #4                  
  ADD R4, R4, #1                 
   B WhileOne

EndWhileOne :                  @ (m != size)
  LDR R5, =4                   @ n = 4
  ADD R4, R4, #1               @ A = A + 1
  MUL R4, R4, R5               @ A = A + 4
  SUB R1, R1, R4               @ Set A = Set A - 4 
  LDR R12, =0                      
  LDR R7, =0 

WhileTwo :                  
  CMP R12, R9                   
  BEQ EndWhileTwo
  LDR R7, [R2]                 @ B = [address B]         
  MOV R4, #0                   @ A = 0 
  LDR R11, [R1]                @ A = [address A]

WhileThree :                  
  CMP R4, R3                   
  BEQ EndWhileThree
  CMP R11, R7 
  BEQ EndWhileThree
  ADD R1, R1, #4              @ A = A + 4
  LDR R11 ,[R1]               @ O = [address A] 
  ADD R4, R4, #1                  
   B WhileThree 
  
 EndWhileThree :     
  MUL R4, R4, R5              @ Z = Z x n        
  SUB R1, R1, R4                  
  CMP R11, R7                      
  BEQ EndMain 
  STR R7 , [R0]               @ B = [addressC]
  ADD R8, R8, #1                 
  ADD R0 , R0, #4             

EndMain : 
  ADD R2, R2, #4              @ B + B = 4 
  ADD R12, R12, #1                 
   B WhileTwo

EndWhileTwo :                
  MOV R9, #0                 
                        
WhileFour :                 
  CMP R6, R0              
  BEQ EndWhileFour 
  ADD R6, R6 , #4                  
  ADD R3, #1                      
   B WhileFour 

EndWhileFour :
  MOV R3, #0                       
  ADD R3, R3, R9              @ x + x = p      
  MOV R10, #0  

WhileFive :
  CMP R9, #0 
  BEQ EndOf 
  SUB R0, R0, #4                   
  LDR R10, [R0]                     
  ADD R0, R0, #4                   
  STR R10, [R0]              @ store k in address C            
  SUB R0 , R0, #4               
  SUB R9, R9, #1                  
   B WhileFive

EndOf :
  STR R3, [R0]               @ store x in address C

  MOV R9, #0                // Formula for counter {
  MOV R4, #4

  ADD R9, R9, R8
  ADD R8, #1
  MUL R8, R8, R4
  SUB R0, R0, R8

  STR R9, [R0]                     @ }



End_Main:
  BX    lr
