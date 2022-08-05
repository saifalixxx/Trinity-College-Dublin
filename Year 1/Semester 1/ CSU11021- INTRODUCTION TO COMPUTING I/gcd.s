  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  @ Write an ARM Assembly Language Program that will compute the GCD (greatest common divisor) of two numbers in R2 and R3.

While :
  CMP R2, R3
  BEQ NotWhile
  CMP R2, R3
  BLS IfWhile
  SUB R2, R2, R3
   B IfNotWhile

IfWhile :
  RSB R3, R2, R3

IfNotWhile :
   B While
   
NotWhile :
  MOV R0, R2
  
   


End_Main:
  BX    lr

.end
