  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:
  CMP R2, R1                         @ if (src > dst) 
  BHS srcSwap                        
  LDR R4, [R0, R1, LSL #2]           @ array = word[address ++]
  MOV R5, R2                         @ end = dst

dstSwap :
  CMP R5, R1                         @ while ( curr >= dst)
  BHI End_Main                       
  LDR R6, [R0, R5, LSL #2]           @ tmp 1 = array[curr]
  STR R4, [R0, R5, LSL #2]           @ tmp 2 = array[curr + 1]
  MOV R4, R6                         @ initial start = data start
  ADD R5, R1, #1                     @ end = src + 1
   B dstSwap                         @ loop if statement equals true

srcSwap :
  CMP R2, R1                         @ else if (dst > src)   
  BLS End_Main    
  LDR R4, [R0, R1, LSL #2]           @ array = word[address++]
  MOV R5, R2                         @ end = dst             

inLoop :
  CMP R5, R1                         @ while ( dst >= curr)
  BLT End_Main
  LDR R6, [R0, R5, LSL #2]           @ tmp 1 = array[curr]
  STR R4, [R0, R5, LSL #2]           @ tmp 2 = array[curr + 1]
  MOV R4, R6                         @ initial start = data start
  SUB R5, R5, #1                     @ end = end - 1
   B inLoop                          @ loop if statement equals true





  @
  @ write your program here
  @


  @ End of program ... check your result

End_Main:
  BX    lr

